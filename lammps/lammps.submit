#!/bin/bash
#SBATCH --job-name=lammps_example
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=2g
#SBATCH --time=00:15:00
#SBATCH --error=lammps_job.%J.err
#SBATCH --output=lammps_job.%J.out

module purge
module load compiler/gcc/11 openmpi/4.1 lammps/23June2022
mpirun lmp < in.atm
