set(CMAKE_HIP_COMPILER "/opt/rocm-5.5.1/llvm/bin/clang++")
set(CMAKE_HIP_COMPILER_ID "Clang")
set(CMAKE_HIP_COMPILER_VERSION "16.0.0")
set(CMAKE_HIP_STANDARD_COMPUTED_DEFAULT "14")
set(CMAKE_HIP_EXTENSIONS_COMPUTED_DEFAULT "OFF")
set(CMAKE_HIP_COMPILE_FEATURES "hip_std_98;hip_std_11;hip_std_14;hip_std_17;hip_std_20;hip_std_23")
set(CMAKE_HIP98_COMPILE_FEATURES "")
set(CMAKE_HIP11_COMPILE_FEATURES "hip_std_11")
set(CMAKE_HIP14_COMPILE_FEATURES "hip_std_14")
set(CMAKE_HIP17_COMPILE_FEATURES "hip_std_17")
set(CMAKE_HIP20_COMPILE_FEATURES "hip_std_20")
set(CMAKE_HIP23_COMPILE_FEATURES "hip_std_23")

set(CMAKE_HIP_PLATFORM_ID "Linux")
set(CMAKE_HIP_SIMULATE_ID "")
set(CMAKE_HIP_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_HIP_SIMULATE_VERSION "")


set(CMAKE_HIP_COMPILER_ROCM_ROOT "/opt/rocm-5.5.1/llvm/bin/../..")

set(CMAKE_HIP_COMPILER_ENV_VAR "HIPCXX")

set(CMAKE_HIP_COMPILER_LOADED 1)
set(CMAKE_HIP_COMPILER_ID_RUN 1)
set(CMAKE_HIP_SOURCE_FILE_EXTENSIONS hip)
set(CMAKE_HIP_LINKER_PREFERENCE 90)
set(CMAKE_HIP_LINKER_PREFERENCE_PROPAGATES 1)

set(CMAKE_HIP_SIZEOF_DATA_PTR "8")
set(CMAKE_HIP_COMPILER_ABI "ELF")
set(CMAKE_HIP_LIBRARY_ARCHITECTURE "")

if(CMAKE_HIP_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_HIP_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_HIP_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_HIP_COMPILER_ABI}")
endif()

if(CMAKE_HIP_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_HIP_TOOLKIT_INCLUDE_DIRECTORIES "")

set(CMAKE_HIP_IMPLICIT_INCLUDE_DIRECTORIES "/opt/rocm-5.5.1/include;/opt/rocm-5.5.1/llvm/lib/clang/16.0.0/include/cuda_wrappers;/opt/cray/pe/gcc/10.3.0/snos/include/g++;/opt/cray/pe/gcc/10.3.0/snos/include/g++/x86_64-suse-linux;/opt/cray/pe/gcc/10.3.0/snos/include/g++/backward;/opt/rocm-5.5.1/llvm/lib/clang/16.0.0/include;/usr/local/include;/usr/include")
set(CMAKE_HIP_IMPLICIT_LINK_LIBRARIES "amdhip64;stdc++;m;gcc_s;c;gcc_s")
set(CMAKE_HIP_IMPLICIT_LINK_DIRECTORIES "/opt/cray/pe/gcc/10.3.0/snos/lib/gcc/x86_64-suse-linux/10.3.0;/opt/cray/pe/gcc/10.3.0/snos/lib64;/lib64;/usr/lib64;/lib;/usr/lib;/opt/rocm-5.5.1/lib")
set(CMAKE_HIP_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")

set(CMAKE_HIP_RUNTIME_LIBRARY_DEFAULT "SHARED")

set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_HIP_COMPILER_AR "/opt/rocm-5.5.1/llvm/bin/llvm-ar")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_HIP_COMPILER_RANLIB "/opt/rocm-5.5.1/llvm/bin/llvm-ranlib")
set(CMAKE_LINKER "/usr/bin/ld")
set(CMAKE_MT "")
