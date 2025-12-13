cmake -S $HOME/GPU_FI/HeCBench \
      -B $HOME/GPU_FI/HeCBench/build \
      -DHECBENCH_BENCHMARKS=matrix-rotate-cuda \
      -DHECBENCH_ENABLE_HIP=OFF \
      -DCMAKE_BUILD_TYPE=Release
cmake --build $HOME/GPU_FI/HeCBench/build --target matrix-rotate-cuda
