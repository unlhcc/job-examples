#!/bin/bash
#SBATCH --job-name=lammps_gpu_example
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=00:15:00
#SBATCH --error=lammps_job.%J.err
#SBATCH --output=lammps_job.%J.out
#SBATCH --partition=gpu
#SBATCH --gres=gpu

module load compiler/gcc/10 openmpi/4.0 lammps-gpu/29Sep2021
mpirun lmp -sf gpu -in in_adapt.lmp
