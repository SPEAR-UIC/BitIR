#!/usr/bin/env python3
import argparse
from pathlib import Path


STRUCTS = r'''
#define TRACE029_MAX_RECORDS 2048

struct Trace029Summary {
  unsigned long long total_threads;
  unsigned long long valid_threads;
  unsigned long long computed_threads;
  unsigned long long final_writing_threads;
  unsigned long long small_block_cols_difference_threads;
  unsigned long long blkX_difference_threads;
  unsigned long long blkXmax_difference_threads;
  unsigned long long xidx_difference_threads;
  unsigned long long predicate_difference_threads;
  unsigned int detail_records;
  unsigned int dropped_detail_records;
};

struct Trace029Record {
  int t, iteration, bx, tx;
  long long expected_small_block_cols_64;
  int actual_small_block_cols_32;
  long long expected_blkX_64;
  int actual_blkX_32;
  long long expected_blkXmax_64;
  int actual_blkXmax_32;
  long long expected_xidx_64;
  int actual_xidx_32;
  int validXmin, validXmax, isValid, computed;
  int final_write_executed, final_write_index, final_write_value;
};
'''

KERNEL_ARGS_OLD = '''    const int cols,
    const int t)'''
KERNEL_ARGS_NEW = '''    const int cols,
    const int t,
    Trace029Summary* traceSummary,
    Trace029Record* traceRecords)'''

AFTER_VALID_OLD = '''  bool isValid = IN_RANGE(tx, validXmin, validXmax);

  if(IN_RANGE(xidx, 0, cols-1))'''
AFTER_VALID_NEW = r'''  bool isValid = IN_RANGE(tx, validXmin, validXmax);

  long long expected_small_block_cols_64 =
      (long long)BLOCK_SIZE - ((long long)iteration * (long long)theHalo * 2LL);
  long long expected_blkX_64 = expected_small_block_cols_64 * (long long)bx - (long long)borderCols;
  long long expected_blkXmax_64 = expected_blkX_64 + (long long)BLOCK_SIZE - 1LL;
  long long expected_xidx_64 = expected_blkX_64 + (long long)tx;
  long long expected_validXmin_64 = expected_blkX_64 < 0 ? -expected_blkX_64 : 0;
  long long expected_validXmax_64 = expected_blkXmax_64 > (long long)cols - 1LL
      ? (long long)BLOCK_SIZE - 1LL - (expected_blkXmax_64 - (long long)cols + 1LL)
      : (long long)BLOCK_SIZE - 1LL;
  bool expected_isValid = (long long)tx >= expected_validXmin_64 &&
                          (long long)tx <= expected_validXmax_64;
  bool computed_any = false;
  bool expected_computed_any = iteration > 0 && tx >= 1 && tx <= BLOCK_SIZE - 2 && expected_isValid;

  atomicAdd(&traceSummary->total_threads, 1ULL);
  if (isValid) atomicAdd(&traceSummary->valid_threads, 1ULL);
  if ((long long)small_block_cols != expected_small_block_cols_64)
    atomicAdd(&traceSummary->small_block_cols_difference_threads, 1ULL);
  if ((long long)blkX != expected_blkX_64)
    atomicAdd(&traceSummary->blkX_difference_threads, 1ULL);
  if ((long long)blkXmax != expected_blkXmax_64)
    atomicAdd(&traceSummary->blkXmax_difference_threads, 1ULL);
  if ((long long)xidx != expected_xidx_64)
    atomicAdd(&traceSummary->xidx_difference_threads, 1ULL);

  if(IN_RANGE(xidx, 0, cols-1))'''

COMPUTED_OLD = '''      computed = true;
      int left = prev[W];'''
COMPUTED_NEW = '''      computed = true;
      computed_any = true;
      int left = prev[W];'''

FINAL_OLD = '''  if (computed)
  {
    gpuResult[xidx] = result[tx];
  }
}'''
FINAL_NEW = r'''  bool final_write_executed = computed;
  if (computed_any) atomicAdd(&traceSummary->computed_threads, 1ULL);
  if (final_write_executed) atomicAdd(&traceSummary->final_writing_threads, 1ULL);
  bool predicate_difference = expected_isValid != isValid || expected_computed_any != computed_any;
  if (predicate_difference) atomicAdd(&traceSummary->predicate_difference_threads, 1ULL);

  bool trace_detail =
      (long long)small_block_cols != expected_small_block_cols_64 ||
      (long long)blkX != expected_blkX_64 ||
      (long long)blkXmax != expected_blkXmax_64 ||
      (long long)xidx != expected_xidx_64 || predicate_difference ||
      computed_any || final_write_executed;
  if (trace_detail) {
    unsigned int slot = atomicAdd(&traceSummary->detail_records, 1U);
    if (slot < TRACE029_MAX_RECORDS) {
      Trace029Record* record = &traceRecords[slot];
      record->t = t; record->iteration = iteration; record->bx = bx; record->tx = tx;
      record->expected_small_block_cols_64 = expected_small_block_cols_64;
      record->actual_small_block_cols_32 = small_block_cols;
      record->expected_blkX_64 = expected_blkX_64; record->actual_blkX_32 = blkX;
      record->expected_blkXmax_64 = expected_blkXmax_64; record->actual_blkXmax_32 = blkXmax;
      record->expected_xidx_64 = expected_xidx_64; record->actual_xidx_32 = xidx;
      record->validXmin = validXmin; record->validXmax = validXmax;
      record->isValid = isValid ? 1 : 0; record->computed = computed_any ? 1 : 0;
      record->final_write_executed = final_write_executed ? 1 : 0;
      record->final_write_index = final_write_executed ? xidx : -1;
      record->final_write_value = final_write_executed ? result[tx] : 0;
    } else {
      atomicAdd(&traceSummary->dropped_detail_records, 1U);
    }
  }

  if (computed)
  {
    gpuResult[xidx] = result[tx];
  }
}'''

ALLOC_OLD = '''  int* d_outputBuffer;
  cudaMalloc((void**)&d_outputBuffer, sizeof(int)*16384);

  dim3 gridDim (size/lws);'''
ALLOC_NEW = '''  int* d_outputBuffer;
  cudaMalloc((void**)&d_outputBuffer, sizeof(int)*16384);

  Trace029Summary* d_traceSummary;
  Trace029Record* d_traceRecords;
  cudaMalloc((void**)&d_traceSummary, sizeof(Trace029Summary));
  cudaMalloc((void**)&d_traceRecords, sizeof(Trace029Record)*TRACE029_MAX_RECORDS);
  cudaMemset(d_traceSummary, 0, sizeof(Trace029Summary));
  cudaMemset(d_traceRecords, 0, sizeof(Trace029Record)*TRACE029_MAX_RECORDS);

  dim3 gridDim (size/lws);'''

CALL_OLD = ('        d_gpuWall, d_gpuSrc, d_gpuResult, d_outputBuffer, ' + '\n' +
            '        iteration, theHalo, borderCols, cols, t);')
CALL_NEW = ('        d_gpuWall, d_gpuSrc, d_gpuResult, d_outputBuffer, ' + '\n' +
            '        iteration, theHalo, borderCols, cols, t, d_traceSummary, d_traceRecords);')

COPY_OLD = '''  cudaMemcpy(result, d_gpuSrc, sizeof(int)*cols, cudaMemcpyDeviceToHost);
  cudaMemcpy(outputBuffer, d_outputBuffer, sizeof(int)*16348, cudaMemcpyDeviceToHost);

  cudaFree(d_gpuResult);'''
COPY_NEW = r'''  cudaMemcpy(result, d_gpuSrc, sizeof(int)*cols, cudaMemcpyDeviceToHost);
  cudaMemcpy(outputBuffer, d_outputBuffer, sizeof(int)*16348, cudaMemcpyDeviceToHost);

  Trace029Summary traceSummary;
  Trace029Record traceRecords[TRACE029_MAX_RECORDS];
  cudaMemcpy(&traceSummary, d_traceSummary, sizeof(traceSummary), cudaMemcpyDeviceToHost);
  unsigned int traceRecordCount = traceSummary.detail_records < TRACE029_MAX_RECORDS
      ? traceSummary.detail_records : TRACE029_MAX_RECORDS;
  cudaMemcpy(traceRecords, d_traceRecords, sizeof(Trace029Record)*traceRecordCount, cudaMemcpyDeviceToHost);
  const char* tracePrefix = getenv("TRACE029_RUNTIME_PREFIX");
  const char* tracePhase = getenv("TRACE029_RUNTIME_PHASE");
  if (tracePrefix && tracePrefix[0]) {
    char summaryPath[4096], recordsPath[4096];
    snprintf(summaryPath, sizeof(summaryPath), "%s_runtime_summary.csv", tracePrefix);
    snprintf(recordsPath, sizeof(recordsPath), "%s_runtime_records.csv", tracePrefix);
    FILE* summaryFile = fopen(summaryPath, "w");
    if (summaryFile) {
      fprintf(summaryFile, "backend,phase,total_threads,valid_threads,computed_threads,final_writing_threads,small_block_cols_difference_threads,blkX_difference_threads,blkXmax_difference_threads,xidx_difference_threads,predicate_difference_threads,detail_records,dropped_detail_records\n");
      fprintf(summaryFile, "nvidia,%s,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%llu,%u,%u\n",
          tracePhase ? tracePhase : "unknown", traceSummary.total_threads, traceSummary.valid_threads,
          traceSummary.computed_threads, traceSummary.final_writing_threads,
          traceSummary.small_block_cols_difference_threads, traceSummary.blkX_difference_threads,
          traceSummary.blkXmax_difference_threads, traceSummary.xidx_difference_threads,
          traceSummary.predicate_difference_threads, traceRecordCount, traceSummary.dropped_detail_records);
      fclose(summaryFile);
    }
    FILE* recordsFile = fopen(recordsPath, "w");
    if (recordsFile) {
      fprintf(recordsFile, "backend,phase,t,iteration,bx,tx,expected_small_block_cols_64,actual_small_block_cols_32,expected_blkX_64,actual_blkX_32,expected_blkXmax_64,actual_blkXmax_32,expected_xidx_64,actual_xidx_32,validXmin,validXmax,isValid,computed,final_write_executed,final_write_index,final_write_value\n");
      for (unsigned int i = 0; i < traceRecordCount; ++i) {
        Trace029Record* record = &traceRecords[i];
        fprintf(recordsFile, "nvidia,%s,%d,%d,%d,%d,%lld,%d,%lld,%d,%lld,%d,%lld,%d,%d,%d,%d,%d,%d,%d,%d\n",
            tracePhase ? tracePhase : "unknown", record->t, record->iteration, record->bx, record->tx,
            record->expected_small_block_cols_64, record->actual_small_block_cols_32,
            record->expected_blkX_64, record->actual_blkX_32,
            record->expected_blkXmax_64, record->actual_blkXmax_32,
            record->expected_xidx_64, record->actual_xidx_32,
            record->validXmin, record->validXmax, record->isValid, record->computed,
            record->final_write_executed, record->final_write_index, record->final_write_value);
      }
      fclose(recordsFile);
    }
  }

  cudaFree(d_traceSummary);
  cudaFree(d_traceRecords);
  cudaFree(d_gpuResult);'''


def replace_once(text, old, new, label):
    count = text.count(old)
    if count != 1:
        raise SystemExit("expected one %s anchor, found %d" % (label, count))
    return text.replace(old, new, 1)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("source")
    parser.add_argument("output")
    args = parser.parse_args()
    text = Path(args.source).read_text(encoding="utf-8")
    text = replace_once(text, "void fatal(char *s)", STRUCTS + "\nvoid fatal(char *s)", "struct")
    text = replace_once(text, KERNEL_ARGS_OLD, KERNEL_ARGS_NEW, "kernel arguments")
    text = replace_once(text, AFTER_VALID_OLD, AFTER_VALID_NEW, "validity")
    text = replace_once(text, COMPUTED_OLD, COMPUTED_NEW, "computed")
    text = replace_once(text, FINAL_OLD, FINAL_NEW, "final write")
    text = replace_once(text, ALLOC_OLD, ALLOC_NEW, "trace allocation")
    text = replace_once(text, CALL_OLD, CALL_NEW, "kernel call")
    text = replace_once(text, COPY_OLD, COPY_NEW, "trace copy")
    Path(args.output).write_text(text, encoding="utf-8")


if __name__ == "__main__":
    main()
