#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=10240
#SBATCH --job-name=invertRandArray
#SBATCH --error=parallel.%J.err
#SBATCH --output=parallel.%J.out
#SBATCH --workdir=/work/swanson/cathrine98/job-examples/matlab

module load matlab/r2014b

mkdir -p /tmp/$SLURM_JOB_ID
matlab -nodisplay -r "invertRand('10^4'), quit"
