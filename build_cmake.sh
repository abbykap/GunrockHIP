#!/bin/bash

# Options you can adjust

arch="x86_64"

if [[ -z "$CXX_COMPILER" ]]; then
CXX_COMPILER="hipcc" # can be: CC | hipcc . 
fi
export CRAY_CPU_TARGET=x86-64

mkdir -p build && cd build 
rm -rf ./*

module purge
module load DefApps

module load gcc
module load cmake


if [[ ${CXX_COMPILER} == "CC" ]]; then
module load PrgEnv-cray
module load craype-accel-amd-gfx90a
module load rocm
echo "building with CC"

elif [[ ${CXX_COMPILER} == "hipcc" ]]; then
module load PrgEnv-cray
module load rocm
echo "building with hipcc"
fi

module load cmake/3.23.2



export HIP_PLATFORM=amd
cmake -DARCHITECTURE=${arch} -DCMAKE_CXX_COMPILER=${CXX_COMPILER} -DAMDGPU_TARGETS="gfx90a" ..

VERBOSE=1 make bfs
VERBOSE=1 make sssp
VERBOSE=1 make pr
VERBOSE=1 make tc

#VERBOSE=1 make


echo "executable 'v_hip' built in build_bin_dir"

