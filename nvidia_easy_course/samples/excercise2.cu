#include <iostream>

// Kernel function to print thread and block indices
__global__
void printIndices()
{
  printf("Block: %d, Thread: %d\n", blockIdx.x, threadIdx.x);
}

int main(void) {
  // Launch kernel with 2 blocks, each containing 5 threads
  printIndices<<<2, 5>>>();

  // Wait for GPU to finish before accessing on host
  cudaDeviceSynchronize();

  return 0;
}
