module use /soft/modulefiles
module load spack-pe-base cmake

cmake -S $HOME/GPU_FI/HeCBench \
      -B $HOME/GPU_FI/HeCBench/build \
      -DHECBENCH_BENCHMARKS="matrix-rotate-cuda;jacobi-cuda;layout-cuda;atomicCost-cuda;dense-embedding-cuda;pathfinder-cuda;bsearch-cuda;entropy-cuda;colorwheel-cuda;randomAccess-cuda" \
      -DHECBENCH_ENABLE_HIP=OFF \
      -DCMAKE_BUILD_TYPE=Release
cmake --build $HOME/GPU_FI/HeCBench/build --target \
  matrix-rotate-cuda \
  jacobi-cuda \
  layout-cuda \
  atomicCost-cuda \
  dense-embedding-cuda \
  pathfinder-cuda \
  bsearch-cuda \
  entropy-cuda \
  colorwheel-cuda \
  randomAccess-cuda
