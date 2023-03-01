#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --mem-per-cpu=4096
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=gromacs_gpu
#SBATCH --partition=gpu
#SBATCH --gres=gpu
#SBATCH --error=gromacs_gpu.%J.stderr
#SBATCH --output=gromacs_gpu.%J.stdout

module purge
module load compiler/gcc/10 gromacs-gpu/2023

gmx mdrun -nt 1 -nb gpu -pme gpu -bonded gpu
