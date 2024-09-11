# Install script for directory: /lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/sssp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/color/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/geo/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/pr/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/ppr/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/bc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/hits/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/kcore/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/spmv/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/spgemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/mst/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/lustre/orion/gen150/world-shared/abby-summer24/gunrock_hip_develop/gunrock-hip-develop/examples/algorithms/tc/cmake_install.cmake")
endif()

