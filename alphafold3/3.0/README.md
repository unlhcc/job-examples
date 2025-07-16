Examples for running [AlphaFold 3](https://github.com/google-deepmind/alphafold3)

- For a full AlphaFold 3 run, please see `alphafold_gpu.submit`.

- To split the AlphaFold 3 run into two sequential runs (CPU-only I/O intensive MSA search and GPU intensive inference based structure prediction), please see:
    - `alphafold_part1_cpu.submit`
    - `alphafold_part2_gpu.submit`
