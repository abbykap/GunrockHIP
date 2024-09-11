# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /autofs/nccs-svm1_sw/frontier/spack-envs/base/opt/linux-sles15-x86_64/gcc-7.5.0/cmake-3.23.2-4r4mpiba7cwdw2hlakh5i7tchi64s3qd/bin/cmake

# The command to remove a file.
RM = /autofs/nccs-svm1_sw/frontier/spack-envs/base/opt/linux-sles15-x86_64/gcc-7.5.0/cmake-3.23.2-4r4mpiba7cwdw2hlakh5i7tchi64s3qd/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop

# Include any dependencies generated for this target.
include examples/algorithms/bc/CMakeFiles/bc.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/algorithms/bc/CMakeFiles/bc.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/algorithms/bc/CMakeFiles/bc.dir/progress.make

# Include the compile flags for this target's objects.
include examples/algorithms/bc/CMakeFiles/bc.dir/flags.make

examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.o: examples/algorithms/bc/CMakeFiles/bc.dir/flags.make
examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.o: examples/algorithms/bc/bc.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building HIP object examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.o"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/rocm-5.5.1/llvm/bin/clang++ $(HIP_DEFINES) $(HIP_INCLUDES) $(HIP_FLAGS) -o CMakeFiles/bc.dir/bc.cu.o -x hip -c /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc/bc.cu

examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing HIP source to CMakeFiles/bc.dir/bc.cu.i"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/rocm-5.5.1/llvm/bin/clang++ $(HIP_DEFINES) $(HIP_INCLUDES) $(HIP_FLAGS) -E /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc/bc.cu > CMakeFiles/bc.dir/bc.cu.i

examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling HIP source to assembly CMakeFiles/bc.dir/bc.cu.s"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/rocm-5.5.1/llvm/bin/clang++ $(HIP_DEFINES) $(HIP_INCLUDES) $(HIP_FLAGS) -S /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc/bc.cu -o CMakeFiles/bc.dir/bc.cu.s

examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o: examples/algorithms/bc/CMakeFiles/bc.dir/flags.make
examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o: include/gunrock/util/gitsha1make.c
examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o: examples/algorithms/bc/CMakeFiles/bc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/cray/pe/gcc/12.2.0/snos/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o -MF CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o.d -o CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o -c /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/include/gunrock/util/gitsha1make.c

examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.i"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/cray/pe/gcc/12.2.0/snos/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/include/gunrock/util/gitsha1make.c > CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.i

examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.s"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && /opt/cray/pe/gcc/12.2.0/snos/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/include/gunrock/util/gitsha1make.c -o CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.s

# Object files for target bc
bc_OBJECTS = \
"CMakeFiles/bc.dir/bc.cu.o" \
"CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o"

# External object files for target bc
bc_EXTERNAL_OBJECTS =

bin/bc: examples/algorithms/bc/CMakeFiles/bc.dir/bc.cu.o
bin/bc: examples/algorithms/bc/CMakeFiles/bc.dir/__/__/__/include/gunrock/util/gitsha1make.c.o
bin/bc: examples/algorithms/bc/CMakeFiles/bc.dir/build.make
bin/bc: /opt/rocm-5.5.1/lib/libamdhip64.so.5.5.50501
bin/bc: /opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0/libgcc.a
bin/bc: /opt/rocm-5.5.1/lib/libamdhip64.so.5.5.50501
bin/bc: examples/algorithms/bc/CMakeFiles/bc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking HIP executable ../../../bin/bc"
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/algorithms/bc/CMakeFiles/bc.dir/build: bin/bc
.PHONY : examples/algorithms/bc/CMakeFiles/bc.dir/build

examples/algorithms/bc/CMakeFiles/bc.dir/clean:
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc && $(CMAKE_COMMAND) -P CMakeFiles/bc.dir/cmake_clean.cmake
.PHONY : examples/algorithms/bc/CMakeFiles/bc.dir/clean

examples/algorithms/bc/CMakeFiles/bc.dir/depend:
	cd /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc/CMakeFiles/bc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/algorithms/bc/CMakeFiles/bc.dir/depend

