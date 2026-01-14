# Install script for directory: /home/mdunlavy/GPU_FI/HeCBench/src

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jacobi-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jacobi-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jacobi-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jacobi-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bfs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bfs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bfs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bfs-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attention-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attention-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attention-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attention-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/accuracy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/accuracy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/accuracy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/accuracy-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ace-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ace-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ace-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ace-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adam-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adam-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adam-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adam-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adamw-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adamw-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adamw-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adamw-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aes-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aes-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aes-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aes-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/affine-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/affine-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/affine-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/affine-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aidw-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aidw-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aidw-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aidw-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/amgmk-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/amgmk-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/amgmk-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/amgmk-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aobench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aobench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aobench-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aobench-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/backprop-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/backprop-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/backprop-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/backprop-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bilateral-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bilateral-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bilateral-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bilateral-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cfd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cfd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cfd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cfd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clenergy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clenergy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clenergy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clenergy-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dct8x8-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dct8x8-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dct8x8-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dct8x8-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fft-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fft-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fft-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fft-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gaussian-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gaussian-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gaussian-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gaussian-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geodesic-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geodesic-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geodesic-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geodesic-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/glu-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/glu-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/glu-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/glu-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gmm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gmm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gmm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gmm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heartwall-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heartwall-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heartwall-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heartwall-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hmm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hmm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hmm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hmm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hybridsort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hybridsort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hybridsort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hybridsort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/idivide-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/idivide-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/idivide-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/idivide-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interleave-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interleave-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interleave-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interleave-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/inversek2j-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/inversek2j-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/inversek2j-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/inversek2j-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ising-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ising-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ising-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ising-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/knn-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/knn-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/knn-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/knn-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lebesgue-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lebesgue-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lebesgue-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lebesgue-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lud-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lud-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lud-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lud-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md5hash-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md5hash-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md5hash-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/md5hash-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minimod-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minimod-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minimod-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minkowski-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minkowski-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minkowski-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minkowski-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mixbench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mixbench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mixbench-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mixbench-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nn-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nn-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nn-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nn-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nw-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nw-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nw-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nw-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particlefilter-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particlefilter-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particlefilter-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particlefilter-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pathfinder-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pathfinder-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pathfinder-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pathfinder-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perplexity-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perplexity-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perplexity-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perplexity-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qtclustering-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qtclustering-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qtclustering-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qtclustering-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/randomAccess-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/randomAccess-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/randomAccess-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/randomAccess-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/remap-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/remap-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/remap-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sad-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sad-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sad-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sad-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatter-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatter-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatter-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/srad-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/srad-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/srad-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/srad-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sssp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sssp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sssp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamcluster-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamcluster-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamcluster-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamcluster-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/su3-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/su3-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/su3-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/su3-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/triad-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/triad-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/triad-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/triad-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsa-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsa-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsa-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsa-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xsbench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xsbench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xsbench-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xsbench-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adjacent-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adjacent-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adjacent-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adjacent-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/adv-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aligned-types-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aligned-types-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aligned-types-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aligned-types-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/all-pairs-distance-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/all-pairs-distance-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/all-pairs-distance-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/all-pairs-distance-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ans-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ans-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ans-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ans-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aop-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aop-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aop-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/aop-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asmooth-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asmooth-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asmooth-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asmooth-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/assert-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/assert-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/assert-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/assert-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asta-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asta-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asta-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/asta-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atan2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atan2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atan2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atan2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCost-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCost-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCost-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCost-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicIntrinsics-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicIntrinsics-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicIntrinsics-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicIntrinsics-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicPerf-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicPerf-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicPerf-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicPerf-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicReduction-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicReduction-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicReduction-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicReduction-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/babelstream-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/babelstream-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/babelstream-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/babelstream-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/background-subtract-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/background-subtract-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/background-subtract-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/background-subtract-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bezier-surface-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bezier-surface-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bezier-surface-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bezier-surface-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/binomial-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/binomial-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/binomial-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/binomial-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitonic-sort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitonic-sort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitonic-sort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitonic-sort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/black-scholes-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/black-scholes-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/black-scholes-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/black-scholes-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/burger-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/burger-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/burger-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/burger-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bwt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bwt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bwt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bwt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelSum-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelSum-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelSum-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelSum-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chi2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chi2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chi2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chi2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clink-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clink-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clink-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clink-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cobahh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cobahh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cobahh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cobahh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/compute-score-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/compute-score-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/compute-score-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/compute-score-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution1D-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution1D-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution1D-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution1D-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolutionSeparable-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolutionSeparable-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolutionSeparable-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolutionSeparable-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crc64-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crc64-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crc64-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crc64-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crs-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/damage-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/damage-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/damage-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/damage-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/degrid-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/degrid-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/degrid-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/degrid-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/diamond-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/diamond-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/diamond-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dslash-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dslash-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dslash-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dslash-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d2q9-bgk-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d2q9-bgk-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d2q9-bgk-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d2q9-bgk-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d3q19-bgk-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d3q19-bgk-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/d3q19-bgk-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ddbp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ddbp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ddbp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ddbp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/debayer-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/debayer-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/debayer-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/debayer-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dense-embedding-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dense-embedding-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dense-embedding-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dense-embedding-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/depixel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/depixel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/depixel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/depixel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/deredundancy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/deredundancy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/deredundancy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/deredundancy-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/determinant-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/determinant-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/determinant-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dispatch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dispatch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dispatch-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/distort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/distort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/distort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/distort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/divergence-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/divergence-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/divergence-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/divergence-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/doh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/doh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/doh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/doh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dpid-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dpid-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dpid-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dropout-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dropout-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dropout-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dwconv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dwconv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dwconv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dxtc2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dxtc2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dxtc2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/dxtc2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/easyWave-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/easyWave-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/easyWave-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/easyWave-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ecdh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ecdh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ecdh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ecdh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/egs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/egs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eigenvalue-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eigenvalue-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eigenvalue-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eigenvalue-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eikonal-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eikonal-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/eikonal-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/entropy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/entropy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/entropy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/entropy-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/epistasis-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/epistasis-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/epistasis-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/epistasis-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ert-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ert-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ert-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/expdist-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/expdist-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/expdist-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/expdist-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extend2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extend2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extend2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extend2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extrema-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extrema-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extrema-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/extrema-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16atomic-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16atomic-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16atomic-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16max-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16max-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16max-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16sp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16sp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/f16sp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/face-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/face-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/face-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/face-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fdtd3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fdtd3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fdtd3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fdtd3d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/feynman-kac-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/feynman-kac-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/feynman-kac-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/feynman-kac-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fhd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fhd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fhd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fhd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/filter-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/filter-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/filter-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/filter-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flame-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flame-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flame-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flip-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flip-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flip-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/flip-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/floydwarshall2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fluidSim-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fluidSim-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fluidSim-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fluidSim-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fma-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fma-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fma-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpdc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpdc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpdc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fpdc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frechet-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frechet-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frechet-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frechet-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fresnel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fresnel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fresnel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fresnel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frna-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frna-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frna-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/frna-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fsm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fsm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fsm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fsm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fwt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fwt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fwt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/fwt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ga-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ga-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ga-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ga-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gabor-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gabor-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gabor-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gabor-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gamma-correction-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gamma-correction-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gamma-correction-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gamma-correction-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geam-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geam-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geam-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geglu-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geglu-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geglu-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/geglu-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gels-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gels-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gels-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gelu-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gelu-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gelu-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gemv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gemv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gemv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ge-spmm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ge-spmm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ge-spmm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gibbs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gibbs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gibbs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/goulash-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/goulash-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/goulash-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/goulash-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gpp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gpp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gpp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gpp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphB+-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphB+-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphB+-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphExecution-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphExecution-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/graphExecution-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grep-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grep-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grep-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grep-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grrt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grrt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grrt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/grrt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gru-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gru-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/gru-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haccmk-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haccmk-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haccmk-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haccmk-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hausdorff-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hausdorff-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hausdorff-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hausdorff-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haversine-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haversine-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haversine-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/haversine-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hbc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hbc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hbc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat2d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat2d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat2d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/heat2d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hellinger-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hellinger-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hellinger-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hellinger-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/henry-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/henry-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/henry-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/henry-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hexciton-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hexciton-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hexciton-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hexciton-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/histogram-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/histogram-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/histogram-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/histogram-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hogbom-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hogbom-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hogbom-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hogbom-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot3D-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot3D-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot3D-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hotspot3D-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hungarian-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hungarian-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hungarian-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hwt1d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hwt1d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hwt1d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hwt1d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hypterm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hypterm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hypterm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/hypterm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interval-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interval-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interval-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/interval-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/intrinsics-cast-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/intrinsics-cast-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/intrinsics-cast-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/intrinsics-simd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/is-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/is-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/is-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/iso2dfd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/iso2dfd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/iso2dfd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/iso2dfd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jaccard-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jaccard-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jaccard-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jenkins-hash-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jenkins-hash-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jenkins-hash-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/jenkins-hash-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kalman-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kalman-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kalman-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kalman-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keccaktreehash-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keccaktreehash-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keccaktreehash-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keccaktreehash-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keogh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keogh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keogh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/keogh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kernelLaunch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kernelLaunch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kernelLaunch-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kernelLaunch-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kiss-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kiss-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kiss-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmeans-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmeans-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmeans-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kmeans-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kurtosis-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kurtosis-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/kurtosis-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lanczos-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lanczos-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lanczos-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lanczos-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langevin-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langevin-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langevin-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langevin-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langford-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langford-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langford-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/langford-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/laplace3d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lavaMD-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lavaMD-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lavaMD-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lavaMD-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layernorm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layernorm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layernorm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layout-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layout-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layout-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/layout-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lci-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lci-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lci-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lci-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lda-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lda-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lda-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lda-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ldpc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ldpc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ldpc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ldpc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lfib4-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lfib4-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lfib4-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/libor-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/libor-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/libor-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/libor-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lid-driven-cavity-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lid-driven-cavity-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lid-driven-cavity-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lid-driven-cavity-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lif-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lif-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lif-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lif-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/linearprobing-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/linearprobing-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/linearprobing-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/linearprobing-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/log2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/log2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/log2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/log2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/logic-rewrite-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/logic-rewrite-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/logprob-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/logprob-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/logprob-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lombscargle-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lombscargle-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lombscargle-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lombscargle-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/loopback-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/loopback-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/loopback-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/loopback-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lr-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lr-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lr-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lr-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lrn-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lrn-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lrn-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lrn-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lsqt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lsqt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lsqt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lsqt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ludb-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ludb-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ludb-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lulesh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lulesh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lulesh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lulesh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lut-gemm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lut-gemm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lut-gemm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lzss-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lzss-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/lzss-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mallocFree-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mallocFree-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mallocFree-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mallocFree-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mandelbrot-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mandelbrot-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mandelbrot-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mandelbrot-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/marchingCubes-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/marchingCubes-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/marchingCubes-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mask-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mask-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mask-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mask-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/match-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/match-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/match-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/match-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matern-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matern-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matern-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matern-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrix-rotate-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrix-rotate-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrix-rotate-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrix-rotate-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrixT-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrixT-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/matrixT-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxFlops-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxFlops-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxFlops-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxFlops-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxpool3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxpool3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxpool3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/maxpool3d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcmd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcmd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcmd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcmd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcpr-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcpr-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcpr-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mcpr-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mdh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mdh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mdh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mdh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/meanshift-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/meanshift-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/meanshift-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/meanshift-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/medianfilter-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/medianfilter-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/medianfilter-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/medianfilter-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memcpy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memcpy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memcpy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memcpy-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memtest-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memtest-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memtest-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/memtest-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merge-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merge-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merge-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merge-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merkle-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merkle-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/merkle-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/metropolis-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/metropolis-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/metropolis-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/metropolis-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/michalewicz-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/michalewicz-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/michalewicz-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/michalewicz-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minibude-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minibude-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minibude-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minibude-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minisweep-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minisweep-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minisweep-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minisweep-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/miniWeather-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/miniWeather-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/miniWeather-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/miniWeather-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minmax-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minmax-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/minmax-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mis-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mis-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mis-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mis-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mmcsf-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mmcsf-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mmcsf-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mnist-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mnist-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mnist-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/moe-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/moe-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/moe-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/morphology-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/morphology-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/morphology-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/morphology-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mpc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mpc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mpc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mr-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mr-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mr-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mr-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrg32k3a-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrg32k3a-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mrg32k3a-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mriQ-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mriQ-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mriQ-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mriQ-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mtf-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mtf-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mtf-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multimaterial-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multimaterial-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multimaterial-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multimaterial-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multinomial-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multinomial-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/multinomial-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/murmurhash3-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/murmurhash3-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/murmurhash3-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/murmurhash3-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mxfp4-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mxfp4-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/mxfp4-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/myocyte-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/myocyte-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/myocyte-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/myocyte-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbnxm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbnxm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbnxm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbody-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbody-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbody-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nbody-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ne-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ne-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ne-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ne-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nlll-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nlll-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nlll-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nlll-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nms-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nms-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nms-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nms-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nonzero-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nonzero-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nonzero-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/norm2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/norm2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/norm2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/norm2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nosync-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nosync-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nosync-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nqueen-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nqueen-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nqueen-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/nqueen-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ntt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ntt-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ntt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ntt-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/openmp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/openmp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/openmp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/openmp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/opticalFlow-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/opticalFlow-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/opticalFlow-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlap-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlap-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlap-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlay-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlay-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlay-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/overlay-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p2p-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p2p-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p2p-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p4-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p4-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p4-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/p4-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pad-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pad-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pad-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/page-rank-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/page-rank-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/page-rank-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/page-rank-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particle-diffusion-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particle-diffusion-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particle-diffusion-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particle-diffusion-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particles-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particles-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particles-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/particles-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pcc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pcc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pcc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perlin-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perlin-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/perlin-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permutate-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permutate-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permutate-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permutate-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permute-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permute-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permute-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/permute-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/phmm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/phmm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/phmm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/phmm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pingpong-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pingpong-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pingpong-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pitch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pitch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pitch-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pnpoly-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pnpoly-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pnpoly-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pnpoly-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pns-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pns-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pns-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pns-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pointwise-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pointwise-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pointwise-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pointwise-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pool-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pool-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pool-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pool-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/popcount-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/popcount-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/popcount-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/popcount-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prefetch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prefetch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prefetch-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/present-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/present-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/present-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/present-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prna-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prna-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prna-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/prna-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/projectile-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/projectile-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/projectile-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/projectile-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pso-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pso-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pso-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/pso-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qem-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qem-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qem-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qkv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qkv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qkv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qrg-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qrg-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qrg-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/qrg-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quant3MatMul-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quant3MatMul-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quant3MatMul-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantAQLM-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantAQLM-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantAQLM-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantBnB-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantBnB-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantBnB-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantBnB-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantVLLM-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantVLLM-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quantVLLM-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quicksort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quicksort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quicksort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/quicksort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/radixsort2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rainflow-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rainflow-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rainflow-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rainflow-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rayleighBenardConvection-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rayleighBenardConvection-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rayleighBenardConvection-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reaction-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reaction-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reaction-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reaction-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/recursiveGaussian-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/recursiveGaussian-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/recursiveGaussian-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/recursiveGaussian-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/relu-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/relu-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/relu-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resize-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resize-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resize-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resize-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resnet-kernels-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resnet-kernels-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/resnet-kernels-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse2D-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse2D-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/reverse2D-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rfs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rfs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rfs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rfs-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ring-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ring-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ring-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rle-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rle-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rng-wallace-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rng-wallace-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rng-wallace-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rng-wallace-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rodrigues-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rodrigues-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rodrigues-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rodrigues-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/romberg-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/romberg-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/romberg-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/romberg-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rotary-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rotary-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rotary-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rowwiseMoments-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rowwiseMoments-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rowwiseMoments-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsbench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsbench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsbench-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsbench-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsmt-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rsmt-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rtm8-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rtm8-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rtm8-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rtm8-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rushlarsen-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rushlarsen-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rushlarsen-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/rushlarsen-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s3d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s8n-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s8n-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s8n-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/s8n-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sa-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sa-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sa-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sampling-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sampling-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sampling-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sampling-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan2-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan3-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan3-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scan3-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterAdd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterAdd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterAdd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterAdd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterThrust-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterThrust-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scatterThrust-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/scel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/score-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/score-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/score-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sddmm-batch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sddmm-batch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/seam-carving-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/seam-carving-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/seam-carving-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/secp256k1-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/secp256k1-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/secp256k1-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/secp256k1-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segment-reduce-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segment-reduce-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segment-reduce-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segsort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segsort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/segsort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sheath-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sheath-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sheath-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sheath-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shmembench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shmembench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shmembench-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shmembench-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shuffle-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shuffle-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/shuffle-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simplemoc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simplemoc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simplemoc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simplemoc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleMultiDevice-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleMultiDevice-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleMultiDevice-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleSpmv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleSpmv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleSpmv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/simpleSpmv-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slit-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slit-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slit-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slu-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slu-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/slu-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/snake-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/snake-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/snake-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/snake-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobol-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobol-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobol-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sobol-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sort-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sortKV-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sortKV-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sortKV-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sosfil-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sosfil-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sosfil-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sosfil-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sparkler-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sparkler-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sparkler-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spaxpby-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spaxpby-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spd2s-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spd2s-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgeam-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgeam-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgeam-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgemm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgemm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spgemm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sph-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sph-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sph-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sph-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/split-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/split-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/split-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/split-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spmm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spmm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spmv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spmv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spmv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spnnz-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spnnz-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sps2d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sps2d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spsm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spsm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spsort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spsort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/spsort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sptrsv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sptrsv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sptrsv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sptrsv-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ss-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ss-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ss-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ss-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ssim-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ssim-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ssim-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sss-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sss-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sss-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stddev-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stddev-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stddev-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stddev-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil1d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil1d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil1d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil1d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stencil3d-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamCreateCopyDestroy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamCreateCopyDestroy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamCreateCopyDestroy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamOrderedAllocation-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamOrderedAllocation-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamPriority-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamPriority-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamPriority-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamUM-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamUM-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/streamUM-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stsg-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stsg-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/stsg-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/surfel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/surfel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/surfel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/surfel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/svd3x3-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/svd3x3-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/svd3x3-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/svd3x3-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sw4ck-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sw4ck-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sw4ck-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/sw4ck-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/swish-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/swish-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/swish-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/swish-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorAccessor-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorAccessor-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorAccessor-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorT-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorT-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorT-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tensorT-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/testSNAP-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/testSNAP-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/testSNAP-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/testSNAP-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/thomas-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/thomas-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/thomas-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/thomas-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/threadfence-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/threadfence-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/threadfence-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/threadfence-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tissue-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tissue-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tissue-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tissue-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tonemapping-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tonemapping-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tonemapping-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tonemapping-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tpacf-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tpacf-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tpacf-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tqs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tqs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tqs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tqs-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsne-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsne-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsne-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tsp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/unfold-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/unfold-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/unfold-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/urng-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/urng-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/urng-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/urng-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vanGenuchten-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vanGenuchten-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vanGenuchten-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vanGenuchten-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vmc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vmc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vmc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vmc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vol2col-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vol2col-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vol2col-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vol2col-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vote-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vote-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/vote-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/voxelization-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/voxelization-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/voxelization-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpexchange-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpexchange-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpexchange-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpsort-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpsort-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/warpsort-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wedford-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wedford-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wedford-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wedford-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/winograd-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/winograd-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/winograd-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/winograd-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wlcpow-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wlcpow-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wlcpow-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wlcpow-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wmma-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wmma-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wmma-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/word2vec-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/word2vec-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/word2vec-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wordcount-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wordcount-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wordcount-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wordcount-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wsm5-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wsm5-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wsm5-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wsm5-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wyllie-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wyllie-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wyllie-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/wyllie-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xlqc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xlqc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xlqc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/xlqc-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zerocopy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zerocopy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zerocopy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zeropoint-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zeropoint-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zeropoint-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zeropoint-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zmddft-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zmddft-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zmddft-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zmddft-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zoom-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zoom-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/zoom-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/addBiasQKV-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/addBiasQKV-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/addBiasResidualLayerNorm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/addBiasResidualLayerNorm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/addBiasResidualLayerNorm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/allreduce-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/allreduce-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/allreduce-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicAggregate-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicAggregate-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicAggregate-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCAS-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCAS-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicCAS-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicSystemWide-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicSystemWide-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/atomicSystemWide-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attentionMultiHead-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attentionMultiHead-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/attentionMultiHead-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/axhelm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/axhelm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/axhelm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/axhelm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bicgstab-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bicgstab-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bincount-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bincount-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bincount-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitcracker-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitcracker-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitcracker-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpacking-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpacking-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpacking-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpermute-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpermute-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bitpermute-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-dot-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-dot-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-dot-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-fp8gemm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-fp8gemm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmBatched-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmBatched-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmBatched-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx2-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx2-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmEx2-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmStridedBatched-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmStridedBatched-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blas-gemmStridedBatched-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockAccess-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockAccess-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockAccess-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockexchange-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockexchange-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/blockexchange-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bm3d-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bm3d-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bm3d-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bn-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bn-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bn-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bn-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bonds-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bonds-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bonds-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bonds-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/boxfilter-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/boxfilter-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/boxfilter-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/boxfilter-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bscan-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bscan-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bscan-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsearch-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsearch-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsearch-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsearch-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bspline-vgh-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bspline-vgh-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bspline-vgh-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bspline-vgh-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsw-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsw-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/bsw-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/b+tree-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/b+tree-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/b+tree-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/b+tree-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/btree-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/btree-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/car-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/car-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/car-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/car-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cbsfil-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cbsfil-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cbsfil-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cbsfil-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cc-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cc-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cc-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccl-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccl-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccl-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccs-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccs-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccs-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccs-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccsd-trpdrv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccsd-trpdrv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccsd-trpdrv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ccsd-trpdrv-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ced-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ced-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/ced-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chacha20-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chacha20-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chacha20-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chacha20-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelShuffle-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelShuffle-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelShuffle-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/channelShuffle-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/che-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/che-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/che-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/che-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chemv-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chemv-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chemv-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/chemv-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clock-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/clock-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cm-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cm-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cm-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cm-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmembench-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmembench-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmp-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmp-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmp-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cmp-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/collision-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/collision-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/collision-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/colorwheel-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/colorwheel-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/colorwheel-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/colorwheel-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/columnarSolver-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/columnarSolver-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/columnarSolver-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/columnarSolver-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/complex-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/complex-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/complex-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/complex-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concat-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concat-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concat-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concat-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concurrentKernels-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concurrentKernels-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/concurrentKernels-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/contract-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/contract-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/contract-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/contract-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/conversion-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/conversion-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/conversion-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/conversion-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution3D-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution3D-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution3D-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/convolution3D-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cooling-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cooling-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cooling-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cooling-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/coordinates-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/coordinates-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/coordinates-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cross-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cross-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cross-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/cross-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crossEntropy-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crossEntropy-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/crossEntropy-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-fused-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-fused-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-fused-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-online-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-online-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-online-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/softmax-online-omp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tridiagonal-cuda/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tridiagonal-hip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tridiagonal-sycl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mdunlavy/GPU_FI/HeCBench/build-cuda118/src/tridiagonal-omp/cmake_install.cmake")
endif()

