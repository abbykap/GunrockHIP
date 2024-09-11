#ifdef _WIN32
#include <gunrock/util/sysinfo.hxx>
#else
#include <sys/utsname.h>
#endif

#include "nlohmann/json.hpp"
#include <time.h>
#include <regex>
#include <experimental/filesystem>
#include <fstream>
#include <gunrock/cuda/device_properties.hxx>
#include <gunrock/util/compiler.hxx>
#include <gunrock/io/git.hxx>
#include <numeric>
#include <utility>
#include <iostream>
//#include <execution>
namespace gunrock {
namespace util {
namespace stats {

using vertex_t = int;
using edge_t = int;

// Date JSON schema was last updated
std::string schema_version = "2022-10-28";

class system_info_t {
 private:
  struct utsname uts;

 public:
  system_info_t() { uname(&uts); }

  std::string sysname() const { return std::string(uts.sysname); }
  std::string release() const { return std::string(uts.release); }
  std::string version() const { return std::string(uts.version); }
  std::string machine() const { return std::string(uts.machine); }
  std::string nodename() const { return std::string(uts.nodename); }

  void get_sys_info(nlohmann::json* jsn) {
    std::map<std::string, std::string> system_info;
    system_info["sysname"] = sysname();
    system_info["release"] = release();
    system_info["version"] = version();
    system_info["machine"] = machine();
    system_info["nodename"] = nodename();
    jsn->push_back(
        nlohmann::json::object_t::value_type("sysinfo", system_info));
  }
};

void get_gpu_info(nlohmann::json* jsn) {
  gunrock::gcuda::device_properties_t device_properties;
  std::map<std::string, std::string> gpuinfo;

  // If no valid devices
  if (gunrock::gcuda::properties::device_count() == 0) {
    return;
  }

  gunrock::gcuda::properties::set_device_properties(&device_properties);
  gpuinfo["name"] = gunrock::gcuda::properties::gpu_name(device_properties);
  gpuinfo["total_global_mem"] = std::to_string(
      gunrock::gcuda::properties::total_global_memory(device_properties));
  gpuinfo["major"] =
      std::to_string(gunrock::gcuda::properties::sm_major(device_properties));
  gpuinfo["minor"] =
      std::to_string(gunrock::gcuda::properties::sm_minor(device_properties));
  gpuinfo["clock_rate"] =
      std::to_string(gunrock::gcuda::properties::clock_rate(device_properties));
  gpuinfo["multi_processor_count"] = std::to_string(
      gunrock::gcuda::properties::multi_processor_count(device_properties));
  gpuinfo["driver_version"] =
      std::to_string(gunrock::gcuda::properties::driver_version());
  gpuinfo["runtime_version"] =
      std::to_string(gunrock::gcuda::properties::runtime_version());
  gpuinfo["compute_version"] = std::to_string(
      gunrock::gcuda::properties::compute_version(device_properties));

  jsn->push_back(nlohmann::json::object_t::value_type("gpuinfo", gpuinfo));
}

void get_performance_stats(std::vector<int>& edges_visited,
                           std::vector<int>& nodes_visited,
                           edge_t edges,
                           vertex_t vertices,
                           std::vector<int>& search_depths,
                           std::vector<float>& run_times,
                           std::string primitive,
                           std::string filename,
                           std::string graph_type,
                           std::string json_dir,
                           std::string json_file,
                           std::vector<int>& sources,
                           std::vector<std::string>& tags,
                           int argc,
                           char** argv) {
  float avg_run_time;
  float stdev_run_times;
  float min_run_time;
  float max_run_time;
  int avg_search_depth;
  int min_search_depth;
  int max_search_depth;
  float avg_mteps;
  float min_mteps;
  float max_mteps;
  std::string time_s;
  nlohmann::json jsn;
  std::string json_dir_file;
  std::string command_line_call;
  std::vector<int> filtered_edges_visited, filtered_nodes_visited,
      filtered_search_depths, filtered_sources;
  std::vector<float> filtered_run_times;

  // Get average run time
  avg_run_time =
      std::accumulate(run_times.begin(), run_times.end(), 0.0) / run_times.size();

  // Get run time standard deviation
  float sq_sum = std::inner_product(run_times.begin(), run_times.end(),
                                    run_times.begin(), 0.0);
  stdev_run_times =
      std::sqrt(sq_sum / (run_times.size() - 1) - avg_run_time * avg_run_time);

  for (int i = 0; i < run_times.size(); i++) {
    if (abs(avg_run_time - run_times[i]) <= (2 * stdev_run_times)) {
      filtered_edges_visited.push_back(edges_visited[i]);
      filtered_nodes_visited.push_back(nodes_visited[i]);
      filtered_search_depths.push_back(search_depths[i]);
      filtered_run_times.push_back(run_times[i]);
      if (sources.size() > i) {
        filtered_sources.push_back(sources[i]);
      }
    }
  }

  if (filtered_run_times.size() != run_times.size()) {
    avg_run_time =
        std::accumulate(filtered_run_times.begin(), filtered_run_times.end(), 0.0) /
        filtered_run_times.size();

    // Get run time standard deviation
    sq_sum =
        std::inner_product(filtered_run_times.begin(), filtered_run_times.end(),
                           filtered_run_times.begin(), 0.0);
    stdev_run_times = std::sqrt(sq_sum / filtered_run_times.size() -
                                avg_run_time * avg_run_time);
  }

  // Get min and max run times
  min_run_time =
      *std::min_element(filtered_run_times.begin(), filtered_run_times.end());
  max_run_time =
      *std::max_element(filtered_run_times.begin(), filtered_run_times.end());

  // Get average search depth
  avg_search_depth = std::accumulate(filtered_search_depths.begin(),
                                 filtered_search_depths.end(), 0.0) /
                     filtered_search_depths.size();

  // Get min and max search depths
  min_search_depth = *std::min_element(filtered_search_depths.begin(),
                                       filtered_search_depths.end());
  max_search_depth = *std::max_element(filtered_search_depths.begin(),
                                       filtered_search_depths.end());

  // Get MTEPS
  std::vector<float> mteps(filtered_edges_visited.size());
  std::transform(filtered_edges_visited.begin(), filtered_edges_visited.end(),
                 filtered_run_times.begin(), mteps.begin(),
                 std::divides<float>());
  std::transform(mteps.begin(), mteps.end(), mteps.begin(),
                 [](auto& c) { return c / 1000; });

  avg_mteps = std::accumulate(mteps.begin(), mteps.end(), 0.0) / mteps.size();

  min_mteps = *std::min_element(mteps.begin(), mteps.end());
  max_mteps = *std::max_element(mteps.begin(), mteps.end());

  // Get time info
  time_t rawtime;
  struct tm* timeinfo;
  char buffer[80];

  time(&rawtime);
  timeinfo = localtime(&rawtime);

  strftime(buffer, sizeof(buffer), "%a %b %d %H:%M:%S %Y", timeinfo);
  time_s = buffer;

  auto now = std::chrono::system_clock::now();
  auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(
                now.time_since_epoch()) %
            1000;
  std::string time_ms = std::to_string(ms.count());

  // Get command line call
  for (int i = 0; i < argc; i++) {
    command_line_call += argv[i];
    command_line_call += " ";
  }
  command_line_call = command_line_call.substr(0, command_line_call.size() - 1);

  // Write values to JSON object
  jsn.push_back(nlohmann::json::object_t::value_type("engine", "Essentials"));
  jsn.push_back(nlohmann::json::object_t::value_type("primitive", primitive));
  jsn.push_back(nlohmann::json::object_t::value_type("graph_type", graph_type));
  jsn.push_back(
      nlohmann::json::object_t::value_type("edges_visited", edges_visited));
  jsn.push_back(nlohmann::json::object_t::value_type("filtered_edges_visited",
                                                     filtered_edges_visited));
  jsn.push_back(
      nlohmann::json::object_t::value_type("nodes_visited", nodes_visited));
  jsn.push_back(nlohmann::json::object_t::value_type("filtered_nodes_visited",
                                                     filtered_nodes_visited));
  jsn.push_back(nlohmann::json::object_t::value_type("num_edges", edges));
  jsn.push_back(nlohmann::json::object_t::value_type("num_vertices", vertices));
  jsn.push_back(nlohmann::json::object_t::value_type("srcs", sources));
  jsn.push_back(
      nlohmann::json::object_t::value_type("filtered_srcs", filtered_sources));
  jsn.push_back(nlohmann::json::object_t::value_type("tags", tags));
  jsn.push_back(
      nlohmann::json::object_t::value_type("process_times", run_times));
  jsn.push_back(nlohmann::json::object_t::value_type("filtered_process_times",
                                                     filtered_run_times));
  jsn.push_back(
      nlohmann::json::object_t::value_type("search_depths", search_depths));
  jsn.push_back(nlohmann::json::object_t::value_type("filtered_search_depths",
                                                     filtered_search_depths));
  jsn.push_back(nlohmann::json::object_t::value_type("avg_search_depth",
                                                     avg_search_depth));
  jsn.push_back(nlohmann::json::object_t::value_type("min_search_depth",
                                                     min_search_depth));
  jsn.push_back(nlohmann::json::object_t::value_type("max_search_depth",
                                                     max_search_depth));
  jsn.push_back(nlohmann::json::object_t::value_type("graph_file", filename));
  jsn.push_back(
      nlohmann::json::object_t::value_type("avg_process_time", avg_run_time));
  jsn.push_back(nlohmann::json::object_t::value_type("stddev_process_time",
                                                     stdev_run_times));
  jsn.push_back(
      nlohmann::json::object_t::value_type("min_process_time", min_run_time));
  jsn.push_back(
      nlohmann::json::object_t::value_type("max_process_time", max_run_time));
  jsn.push_back(nlohmann::json::object_t::value_type("mteps", mteps));
  jsn.push_back(nlohmann::json::object_t::value_type("avg_mteps", avg_mteps));
  jsn.push_back(nlohmann::json::object_t::value_type("min_mteps", min_mteps));
  jsn.push_back(nlohmann::json::object_t::value_type("max_mteps", max_mteps));
  jsn.push_back(nlohmann::json::object_t::value_type("time", time_s));
  jsn.push_back(
      nlohmann::json::object_t::value_type("command_line", command_line_call));
  jsn.push_back(nlohmann::json::object_t::value_type(
      "git_commit_sha", gunrock::io::git_commit_sha1()));
  jsn.push_back(nlohmann::json::object_t::value_type(
      "schema", gunrock::util::stats::schema_version));
  jsn.push_back(nlohmann::json::object_t::value_type(
      "compiler", gunrock::util::stats::compiler));
  jsn.push_back(nlohmann::json::object_t::value_type(
      "compiler_version", gunrock::util::stats::compiler_version));

  // Get GPU info
  get_gpu_info(&jsn);

  // Get System info
  system_info_t sys;
  sys.get_sys_info(&jsn);

  // Write JSON to file
  if (json_file == "") {
    std::string time_str_filename = time_s.substr(0, time_s.size() - 4) +
                                    time_ms + '_' +
                                    time_s.substr(time_s.length() - 4);
    std::string fn =
        std::experimental::filesystem::path(filename).filename().generic_string();
    int last = fn.find_last_of(".");
    fn = fn.substr(0, last);
    time_str_filename =
        std::regex_replace(time_str_filename, std::regex(" "), "_");
    time_str_filename =
        std::regex_replace(time_str_filename, std::regex(":"), "");
    json_dir_file = json_dir + "/" + primitive + "_" + fn + "_" +
                    time_str_filename + ".json";
  } else {
    json_dir_file = json_dir + "/" + json_file;
  }

  std::ofstream outfile(json_dir_file);
  outfile << jsn.dump(4);
  outfile.close();
}

}  // namespace stats
}  // namespace util
}  // namespace gunrock
