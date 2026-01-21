#include <cmath>
#include <cstdlib>
#include <cstdio>
#include <chrono>
#include <sycl/sycl.hpp>

void rotate_matrix_serial(float *matrix, const int n) {
  for (int layer = 0; layer < n / 2; ++layer) {
    int first = layer;
    int last = n - 1 - layer;
    for(int i = first; i < last; ++i) {
      int offset = i - first;
        float top = matrix[first*n+i]; // save top
        // left -> top
        matrix[first*n+i] = matrix[(last-offset)*n+first];

        // bottom -> left
        matrix[(last-offset)*n+first] = matrix[last*n+(last-offset)];

        // right -> bottom
        matrix[last*n+(last-offset)] = matrix[i*n+last];

        // top -> right
        matrix[i*n+last] = top; // right <- saved top
    }
  }
}

int main(int argc, char** argv) {
  if (argc < 3 || argc > 4) {
    printf("Usage: %s <matrix size> <repeat> [dump file]\n", argv[0]);
    return 1;
  }
  const int n = atoi(argv[1]);
  const int repeat = atoi(argv[2]);
  const char *dump_path = argc == 4 ? argv[3] : nullptr;
  const bool force_dump = std::getenv("HECBENCH_LLFI_FORCE_DUMP") != nullptr;
  const bool gpu_debug = std::getenv("HECBENCH_GPU_DEBUG") != nullptr;

  float *serial_res = (float*) aligned_alloc(1024, n*n*sizeof(float));
  float *matrix = (float*) aligned_alloc(1024, n*n*sizeof(float));

  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      serial_res[i*n+j] = matrix[i*n+j] = i*n+j;

  for (int i = 0; i < repeat; i++) {
    rotate_matrix_serial(serial_res, n);
  }

#ifdef USE_GPU
  sycl::queue q(sycl::gpu_selector_v, sycl::property::queue::in_order());
#else
  sycl::queue q(sycl::cpu_selector_v, sycl::property::queue::in_order());
#endif

  if (gpu_debug) {
    auto dev = q.get_device();
    std::string name = dev.get_info<sycl::info::device::name>();
    std::string driver = dev.get_info<sycl::info::device::driver_version>();
    fprintf(stderr, "[gpu-debug] device=%s driver=%s\n", name.c_str(), driver.c_str());
  }

  float *d_matrix = sycl::malloc_device<float>(n*n, q);
  q.memcpy(d_matrix, matrix, n*n*sizeof(float));

  q.wait();
  auto start = std::chrono::steady_clock::now();

  for (int i = 0; i < repeat; i++) {
    q.submit([&](sycl::handler &h) {
      h.parallel_for<class matrix_rotate>(
        sycl::nd_range<1>(sycl::range<1>((n/2+255)/256*256), sycl::range<1>(256)),
        [=](sycl::nd_item<1> item) {
        int layer = item.get_global_id(0);
        if (layer < n/2) {
          int first = layer;
          int last = n - 1 - layer;
          for(int i = first; i < last; ++i) {
            int offset = i - first;

            float top = d_matrix[first*n+i]; // save top
            // left -> top
            d_matrix[first*n+i] = d_matrix[(last-offset)*n+first];

            // bottom -> left
            d_matrix[(last-offset)*n+first] = d_matrix[last*n+(last-offset)];

            // right -> bottom
            d_matrix[last*n+(last-offset)] = d_matrix[i*n+last];

            // top -> right
            d_matrix[i*n+last] = top; // right <- saved top
          }
        }
      });
    });
  }

  q.wait();
  auto end = std::chrono::steady_clock::now();
  auto time = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
  printf("Average kernel execution time: %f (s)\n", (time * 1e-9f) / repeat);

  q.memcpy(matrix, d_matrix, n*n*sizeof(float)).wait();

  bool ok = true;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (serial_res[i*n+j] != matrix[i*n+j]) {
        ok = false;
        break;
      }
    }
  }

  printf("%s\n", ok ? "PASS" : "FAIL");

  if (dump_path && (ok || force_dump)) {
    FILE *fp = fopen(dump_path, "wb");
    if (!fp) {
      fprintf(stderr, "Failed to open dump file %s\n", dump_path);
    } else {
      size_t total = static_cast<size_t>(n) * n;
      size_t written = fwrite(matrix, sizeof(float), total, fp);
      fclose(fp);
      if (written != total) {
        fprintf(stderr, "Matrix dump incomplete: wrote %zu of %zu elements\n",
                written, total);
      } else {
        printf("Matrix snapshot written to %s\n", dump_path);
      }
    }
  }

  free(serial_res);
  free(matrix);
  sycl::free(d_matrix, q);
  return 0;
}
