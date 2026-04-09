#include <iostream>
#include <math.h>

// Kernel function to add the elements of two arrays
// Now uses threadIdx.x and blockDim.x to parallelize across 256 threads
__global__
void add(int n, float *sum, float *x, float *y)
{
  int index = threadIdx.x;
  int stride = blockDim.x;
  for (int i = index; i < n; i += stride)
    sum[i] = x[i] + y[i];
}

int main(void) {
  int N = 1 << 20; // 1M elements

  // Allocate Unified Memory – accessible from CPU or GPU
  float *x, *y, *sum;
  cudaMallocManaged(&x, N * sizeof(float));
  cudaMallocManaged(&y, N * sizeof(float));
  cudaMallocManaged(&sum, N * sizeof(float));

  // initialize x and y arrays on the host
  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  // Run kernel on 1M elements on the GPU with 1 block of 256 threads
  add<<<1, 256>>>(N, sum, x, y);

  // Wait for GPU to finish before accessing on host
  cudaDeviceSynchronize();

  // Check for errors (all values should be 3.0f)
  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = fmax(maxError, fabs(sum[i] - 3.0f));
  std::cout << "Max error: " << maxError << std::endl;

  // Free memory
  cudaFree(x);
  cudaFree(y);
  cudaFree(sum);

  return 0;
}
