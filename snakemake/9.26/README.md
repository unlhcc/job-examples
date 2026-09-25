# Running Snakemake with SLURM on HCC Clusters

This example shows how to run a Snakemake workflow using the SLURM executor on HCC clusters.

Load the Snakemake module:

```bash
module load snakemake/9.26
```

Run the example workflow with:

```bash
snakemake --executor slurm --jobs 1 -p
```

The workflow submits a job through SLURM and writes the worker node hostname and SLURM job information to `result.txt`.
