/***********************************************************************
 * PathFinder uses dynamic programming to find a path on a 2-D grid from
 * the bottom row to the top row with the smallest accumulated weights,
 * where each step of the path moves straight ahead or diagonally ahead.
 * It iterates row by row, each node picks a neighboring node in the
 * previous row that has the smallest accumulated weight, and adds its
 * own weight to the sum.
 *
 * This kernel uses the technique of ghost zone optimization
 ***********************************************************************/

// Other header files.
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <iostream>
#include <sys/time.h>
#include <hip/hip_runtime.h>


// halo width along one direction when advancing to the next iteration
#define HALO     1
#define STR_SIZE 256
#define DEVICE   0
#define M_SEED   9
#define IN_RANGE(x, min, max)  ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))


void fatal(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

double get_time() {
  struct timeval t;
  gettimeofday(&t,NULL);
  return t.tv_sec+t.tv_usec*1e-6;
}

struct Trace029RuntimeRecord {
  int t;
  int iteration;
  int bx;
  int tx;
  int expected_small_block_cols;
  int actual_small_block_cols;
  int blkX;
  int blkXmax;
  int xidx;
  int validXmin;
  int validXmax;
  int isValid;
  int computed;
  int final_write;
  int index;
  int value;
};

static const int TRACE029_MAX_RUNTIME_RECORDS = 2048;

#line 43 "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu"

__global__ void pathfinder (
    const int*__restrict__ gpuWall,
    const int*__restrict__ gpuSrc,
          int*__restrict__ gpuResult,
          int*__restrict__ outputBuffer,
          Trace029RuntimeRecord* runtimeRecords,
          unsigned int* runtimeRecordSlots,
          unsigned int* totalComputedThreads,
          unsigned int* totalFinalWrites,
    const int iteration,
    const int theHalo,
    const int borderCols,
    const int cols,
    const int t)
{
  int BLOCK_SIZE = blockDim.x;
  int bx = blockIdx.x;
  int tx = threadIdx.x;
  __shared__ int prev[250];
  __shared__ int result[250];

  // Each block finally computes result for a small block
  // after N iterations.
  // it is the non-overlapping small blocks that cover
  // all the input data

  // calculate the small block size.
  int expected_small_block_cols = BLOCK_SIZE - (iteration*theHalo*2);
#line 66 "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu"
  int small_block_cols = BLOCK_SIZE - (iteration*theHalo*2);
#line 68 "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu"

  // calculate the boundary for the block according to
  // the boundary of its small block
  int blkX = (small_block_cols*bx) - borderCols;
  int blkXmax = blkX+BLOCK_SIZE-1;

  // calculate the global thread coordination
  int xidx = blkX+tx;

  // effective range within this block that falls within
  // the valid range of the input data
  // used to rule out computation outside the boundary.
  int validXmin = (blkX < 0) ? -blkX : 0;
  int validXmax = (blkXmax > cols-1) ? BLOCK_SIZE-1-(blkXmax-cols+1) : BLOCK_SIZE-1;

  int W = tx-1;
  int E = tx+1;

  W = (W < validXmin) ? validXmin : W;
  E = (E > validXmax) ? validXmax : E;

  bool isValid = IN_RANGE(tx, validXmin, validXmax);

  if(IN_RANGE(xidx, 0, cols-1))
  {
    prev[tx] = gpuSrc[xidx];
  }

  __syncthreads();

  bool computed;
  int lastDebugIndex = -1;
  int lastDebugValue = 0;
  for (int i = 0; i < iteration; i++)
  {
    computed = false;
    int debugIndex = -1;
    int debugValue = 0;

    if( IN_RANGE(tx, i+1, BLOCK_SIZE-i-2) && isValid )
    {
      computed = true;
      int left = prev[W];
      int up = prev[tx];
      int right = prev[E];
      int shortest = MIN(left, up);
      shortest = MIN(shortest, right);

      int index = cols*(t+i)+xidx;
      result[tx] = shortest + gpuWall[index];
      debugIndex = index;
      debugValue = result[tx];
      lastDebugIndex = debugIndex;
      lastDebugValue = debugValue;
      atomicAdd(totalComputedThreads, 1u);

      if (runtimeRecords != nullptr)
      {
        unsigned int slot = atomicAdd(runtimeRecordSlots, 1u);
        if (slot < TRACE029_MAX_RUNTIME_RECORDS)
        {
          Trace029RuntimeRecord rec;
          rec.t = t;
          rec.iteration = i;
          rec.bx = bx;
          rec.tx = tx;
          rec.expected_small_block_cols = expected_small_block_cols;
          rec.actual_small_block_cols = small_block_cols;
          rec.blkX = blkX;
          rec.blkXmax = blkXmax;
          rec.xidx = xidx;
          rec.validXmin = validXmin;
          rec.validXmax = validXmax;
          rec.isValid = isValid ? 1 : 0;
          rec.computed = 1;
          rec.final_write = 0;
          rec.index = debugIndex;
          rec.value = debugValue;
          runtimeRecords[slot] = rec;
        }
      }

      // ===================================================================
      // add debugging info to the debug output buffer...
      if (tx==11 && i==0)
      {
        // set bufIndex to what value/range of values you want to know.
        int bufIndex = gpuSrc[xidx];
        // dont touch the line below.
        outputBuffer[bufIndex] = 1;
      }
      // ===================================================================
    }

    __syncthreads();

    if(i==iteration-1)
    {
      // we are on the last iteration, and thus don't need to 
      // compute for the next step.
      break;
    }

    if(computed)
    {
      //Assign the computation range
      prev[tx] = result[tx];
    }
    __syncthreads();
  }

  // update the global memory
  // after the last iteration, only threads coordinated within the
  // small block perform the calculation and switch on "computed"
  bool final_write = computed;
  if (computed)
  {
    gpuResult[xidx] = result[tx];
    atomicAdd(totalFinalWrites, 1u);
  }

  if (runtimeRecords != nullptr && final_write)
  {
    unsigned int slot = atomicAdd(runtimeRecordSlots, 1u);
    if (slot < TRACE029_MAX_RUNTIME_RECORDS)
    {
      Trace029RuntimeRecord rec;
      rec.t = t;
      rec.iteration = iteration - 1;
      rec.bx = bx;
      rec.tx = tx;
      rec.expected_small_block_cols = expected_small_block_cols;
      rec.actual_small_block_cols = small_block_cols;
      rec.blkX = blkX;
      rec.blkXmax = blkXmax;
      rec.xidx = xidx;
      rec.validXmin = validXmin;
      rec.validXmax = validXmax;
      rec.isValid = isValid ? 1 : 0;
      rec.computed = computed ? 1 : 0;
      rec.final_write = 1;
      rec.index = lastDebugIndex;
      rec.value = lastDebugValue;
      runtimeRecords[slot] = rec;
    }
  }
}

#line 138 "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu"
int main(int argc, char** argv)
{
  // Program variables.
  int   rows, cols;
  int*  data;
  int** wall;
  int*  result;
  int   pyramid_height;
  const char* dump_path = nullptr;
  const bool force_dump = getenv("HECBENCH_FI_FORCE_DUMP") != nullptr;
  const char* runtime_csv_path = getenv("HECBENCH_TRACE029_RUNTIME_CSV");
  const char* runtime_label = getenv("HECBENCH_TRACE029_RUNTIME_LABEL");
  const bool runtime_debug_enabled = runtime_csv_path && runtime_csv_path[0] != '\0';

  if (argc == 4 || argc == 5)
  {
    cols = atoi(argv[1]);
    rows = atoi(argv[2]);
    pyramid_height = atoi(argv[3]);
    dump_path = (argc == 5) ? argv[4] : nullptr;
  }
  else
  {
    printf("Usage: %s <column length> <row length> <pyramid_height> [dump file]\n", argv[0]);
    exit(0);
  }

  data = new int[rows * cols];
  wall = new int*[rows];
  for (int n = 0; n < rows; n++)
  {
    // wall[n] is set to be the nth row of the data array.
    wall[n] = data + cols * n;
  }
  result = new int[cols];

  int seed = M_SEED;
  srand(seed);

  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      wall[i][j] = rand() % 10;
    }
  }
#ifdef BENCH_PRINT
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      printf("%d ", wall[i][j]);
    }
    printf("\n");
  }
#endif

  // Pyramid parameters.
  const int borderCols = (pyramid_height) * HALO;

  /* printf("pyramidHeight: %d\ngridSize: [%d]\nborder:[%d]\nblockSize: %d\nblockGrid:[%d]\ntargetBlock:[%d]\n",
     pyramid_height, cols, borderCols, NUMBER_THREADS, blockCols, smallBlockCol); */

  int size = rows * cols; // the size (global work size) is a multiple of lws 

  // running the opencl application shows lws=4000 (cpu) and lws=250 (gpu)
  int lws = 250;
  int* outputBuffer = (int*)calloc(16384, sizeof(int));
  int theHalo = HALO;

  double offload_start = get_time();

  int* d_gpuWall;
  hipMalloc((void**)&d_gpuWall, sizeof(int)*(size-cols));
  hipMemcpy(d_gpuWall, data+cols, sizeof(int)*(size-cols), hipMemcpyHostToDevice);

  int* d_gpuSrc;
  hipMalloc((void**)&d_gpuSrc, sizeof(int)*cols);
  hipMemcpy(d_gpuSrc, data, sizeof(int)*cols, hipMemcpyHostToDevice);

  int* d_gpuResult;
  hipMalloc((void**)&d_gpuResult, sizeof(int)*cols);

  int* d_outputBuffer;
  hipMalloc((void**)&d_outputBuffer, sizeof(int)*16384);

  Trace029RuntimeRecord* d_runtimeRecords = nullptr;
  unsigned int* d_runtimeRecordSlots = nullptr;
  unsigned int* d_totalComputedThreads = nullptr;
  unsigned int* d_totalFinalWrites = nullptr;
  Trace029RuntimeRecord* runtimeRecords = nullptr;
  unsigned int runtimeRecordSlots = 0;
  unsigned int totalComputedThreads = 0;
  unsigned int totalFinalWrites = 0;

  if (runtime_debug_enabled) {
    runtimeRecords = (Trace029RuntimeRecord*)calloc(TRACE029_MAX_RUNTIME_RECORDS, sizeof(Trace029RuntimeRecord));
    hipMalloc((void**)&d_runtimeRecords, sizeof(Trace029RuntimeRecord) * TRACE029_MAX_RUNTIME_RECORDS);
    hipMalloc((void**)&d_runtimeRecordSlots, sizeof(unsigned int));
    hipMalloc((void**)&d_totalComputedThreads, sizeof(unsigned int));
    hipMalloc((void**)&d_totalFinalWrites, sizeof(unsigned int));
    hipMemset(d_runtimeRecords, 0, sizeof(Trace029RuntimeRecord) * TRACE029_MAX_RUNTIME_RECORDS);
    hipMemset(d_runtimeRecordSlots, 0, sizeof(unsigned int));
    hipMemset(d_totalComputedThreads, 0, sizeof(unsigned int));
    hipMemset(d_totalFinalWrites, 0, sizeof(unsigned int));
  }

  dim3 gridDim (size/lws);
  dim3 blockDim (lws);

  double kstart = 0.0;

  for (int t = 0; t < rows - 1; t += pyramid_height)
  {
    if (t == pyramid_height) {
      hipDeviceSynchronize();
      kstart = get_time();
    }

    // Calculate this for the kernel argument...
    int iteration = MIN(pyramid_height, rows-t-1);

    hipLaunchKernelGGL(pathfinder, gridDim, blockDim, 0, 0, 
        d_gpuWall, d_gpuSrc, d_gpuResult, d_outputBuffer,
        d_runtimeRecords, d_runtimeRecordSlots, d_totalComputedThreads, d_totalFinalWrites,
        iteration, theHalo, borderCols, cols, t);

    int* temp = d_gpuResult;
    d_gpuResult = d_gpuSrc;
    d_gpuSrc = temp;
  }

  hipDeviceSynchronize();
  double kend = get_time();
  printf("Total kernel execution time: %lf (s)\n", kend - kstart);

  hipMemcpy(result, d_gpuSrc, sizeof(int)*cols, hipMemcpyDeviceToHost);
  hipMemcpy(outputBuffer, d_outputBuffer, sizeof(int)*16348, hipMemcpyDeviceToHost);
  if (runtime_debug_enabled) {
    hipMemcpy(runtimeRecords, d_runtimeRecords, sizeof(Trace029RuntimeRecord) * TRACE029_MAX_RUNTIME_RECORDS, hipMemcpyDeviceToHost);
    hipMemcpy(&runtimeRecordSlots, d_runtimeRecordSlots, sizeof(unsigned int), hipMemcpyDeviceToHost);
    hipMemcpy(&totalComputedThreads, d_totalComputedThreads, sizeof(unsigned int), hipMemcpyDeviceToHost);
    hipMemcpy(&totalFinalWrites, d_totalFinalWrites, sizeof(unsigned int), hipMemcpyDeviceToHost);
  }

  hipFree(d_gpuResult);
  hipFree(d_gpuSrc);
  hipFree(d_gpuWall);
  hipFree(d_outputBuffer);
  if (runtime_debug_enabled) {
    hipFree(d_runtimeRecords);
    hipFree(d_runtimeRecordSlots);
    hipFree(d_totalComputedThreads);
    hipFree(d_totalFinalWrites);
  }

  double offload_end = get_time();
  printf("Device offloading time = %lf (s)\n", offload_end - offload_start);

  // add a null terminator at the end of the string.
  outputBuffer[16383] = '\0';

#ifdef BENCH_PRINT
  for (int i = 0; i < cols; i++)
    printf("%d ", data[i]);
  printf("\n");
  for (int i = 0; i < cols; i++)
    printf("%d ", result[i]);
  printf("\n");
#endif

  if (dump_path && force_dump) {
    FILE* fp = fopen(dump_path, "wb");
    if (!fp) {
      perror("pathfinder dump");
    } else {
      size_t elements = (size_t)cols;
      size_t written = fwrite(result, sizeof(int), elements, fp);
      fclose(fp);
      if (written != elements) {
        fprintf(stderr, "pathfinder: incomplete dump (%zu of %zu elements)\n", written, elements);
      } else {
        printf("pathfinder snapshot written to %s\n", dump_path);
      }
    }
  }

  if (runtime_debug_enabled) {
    FILE* runtimeFp = fopen(runtime_csv_path, "w");
    if (!runtimeFp) {
      perror("trace029 runtime csv");
    } else {
      unsigned int recordsCaptured = runtimeRecordSlots < TRACE029_MAX_RUNTIME_RECORDS ? runtimeRecordSlots : TRACE029_MAX_RUNTIME_RECORDS;
      unsigned int recordsTruncated = runtimeRecordSlots > TRACE029_MAX_RUNTIME_RECORDS ? runtimeRecordSlots - TRACE029_MAX_RUNTIME_RECORDS : 0;
      fprintf(runtimeFp, "run_label,record_kind,record_index,t,iteration,bx,tx,expected_small_block_cols,actual_small_block_cols,blkX,blkXmax,xidx,validXmin,validXmax,isValid,computed,final_write,index,value,total_computed_threads,total_final_writes,records_captured,records_truncated\n");
      for (unsigned int i = 0; i < recordsCaptured; i++) {
        const Trace029RuntimeRecord& rec = runtimeRecords[i];
        fprintf(runtimeFp, "%s,record,%u,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%u,%u,%u,%u\n",
                runtime_label ? runtime_label : "",
                i,
                rec.t,
                rec.iteration,
                rec.bx,
                rec.tx,
                rec.expected_small_block_cols,
                rec.actual_small_block_cols,
                rec.blkX,
                rec.blkXmax,
                rec.xidx,
                rec.validXmin,
                rec.validXmax,
                rec.isValid,
                rec.computed,
                rec.final_write,
                rec.index,
                rec.value,
                totalComputedThreads,
                totalFinalWrites,
                recordsCaptured,
                recordsTruncated);
      }
      fprintf(runtimeFp, "%s,aggregate,-1,,,,,,,,,,,,,,,,,%u,%u,%u,%u\n",
              runtime_label ? runtime_label : "",
              totalComputedThreads,
              totalFinalWrites,
              recordsCaptured,
              recordsTruncated);
      fclose(runtimeFp);
    }
  }

  // Memory cleanup here.
  delete[] data;
  delete[] wall;
  delete[] result;
  free(outputBuffer);
  free(runtimeRecords);

  return EXIT_SUCCESS;
}
