#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=01:00:00
#SBATCH --mem=10GB
#SBATCH --job-name=matlab_gurobi
#SBATCH --error=matlab_gurobi.%J.err
#SBATCH --output=matlab_gurobi.%J.out

module purge
module load gurobi/py310/10 matlab/r2023a

matlab -nodisplay -r "mip1(), quit"
