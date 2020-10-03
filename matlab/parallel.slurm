#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --job-name=invertRandArray
#SBATCH --error=parallel.%J.err
#SBATCH --output=parallel.%J.out

module load matlab/r2020a

mkdir -p /tmp/$SLURM_JOB_ID
matlab -nodisplay -r "invertRand('10^4'), quit"
