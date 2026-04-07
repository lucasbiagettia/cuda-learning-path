# Samples

## nsys_easy

Wrapper script around `nsys` (NVIDIA NSight Systems CLI) to simplify CUDA profiling.

By default it only traces CUDA API calls and runs the `cuda_gpu_sum` report, which combines kernel and memory copy statistics — similar to the legacy `nvprof` output.

### Prerequisites

- [NVIDIA NSight Systems](https://developer.nvidia.com/nsight-systems) installed and `nsys` available in your `$PATH`.

### Usage

```bash
nsys_easy [-t trace] [-s sample] [-c ctxsw] [-o output] [-r report] command
```

#### Options

| Flag | Description | Default |
|------|-------------|---------|
| `-t` | Trace option | `cuda` |
| `-s` | Sample option | `none` |
| `-c` | Context switch option | `none` |
| `-o` | Output file name | `nsys_easy` |
| `-r` | Report name | `cuda_gpu_sum` |

### Example

Profile the `add_cuda` binary from sample `02.cu`:

```bash
# first compile sample 02
nvcc 02.cu -o add_cuda

# profile it
./nsys_easy ./add_cuda
```

Expected output (on an NVIDIA T4):

```
Max error: 0

** CUDA GPU Summary (Kernels/MemOps) (cuda_gpu_sum):

Time (%)  Total Time (ns)  Instances  Category      Operation
--------  ---------------  ---------  -----------   --------------------------
    98.5       75,403,544      1      CUDA_KERNEL   add(int, float *, float *)
     1.0          768,480     48      MEMORY_OPER   [memcpy Unified H2D]
     0.5          352,787     24      MEMORY_OPER   [memcpy Unified D2D]
```

For full `nsys` command line options, see the [NSight Systems User Guide](https://docs.nvidia.com/nsight-systems/UserGuide/index.html).
