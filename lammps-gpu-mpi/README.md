## LAMMPS GPU and MPI Example

This example is based on the LAMMPS example provided by NVIDIA: https://catalog.ngc.nvidia.com/orgs/hpc/containers/lammps

### Steps to run on HCC resources

1. Download the data to your directory. For the input, we increase the number of runs to make the job last longer, from 100 iterations to 100,000 iterations. A copy of the modified input is provided.

```bash
wget https://www.lammps.org/bench/inputs/in.lj.txt && sed -i 's/100/100000/g' in.lj.txt
```

2. Download and modify the submit script. We have provided a copy of the modified file in this example. 

```bash
wget https://gitlab.com/NVHPC/ngc-examples/-/raw/master/lammps/multi-node/slurm/lammps.slurm
```

The modifications to make are:

- Change all instances of `singularity` to `apptainer`
- Change the ntasks value from `16` to `2`
- Remove the `--ntasks-per-socket` value

3. Submit the job to the cluster

```bash
sbatch laamps.slurm
```
