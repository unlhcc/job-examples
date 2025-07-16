#!/bin/bash

#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --time 00:10:00
#SBATCH --partition=gpu
#SBATCH --gpus-per-node=1
#SBATCH --job-name=laamps_gpu_mpi_example
#SBATCH --error=lammps_gpu_mpi_job.%J.err
#SBATCH --output=lammps_gpu_mpi_job.%J.out

set -e; set -o pipefail

# Load required modules
module load apptainer

readonly gpus_per_node=$(( SLURM_NTASKS / SLURM_JOB_NUM_NODES  ))

echo "Running Lennard Jones 8x4x8 example on ${SLURM_NTASKS} GPUS..."
srun --mpi=pmi2 \
apptainer run --nv -B ${PWD}:/host_pwd  docker://nvcr.io/hpc/lammps:29Oct2020 \
lmp -k on g ${gpus_per_node} -sf kk -pk kokkos cuda/aware on neigh full comm device binsize 2.8 -var x 8 -var y 8 -var z 8 -in /host_pwd/in.lj.txt
