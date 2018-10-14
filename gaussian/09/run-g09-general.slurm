#!/bin/sh
#SBATCH -J g09
#SBATCH --nodes=1 --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000
#SBATCH --time=10:00:00
#SBATCH --partition=batch
#SBATCH --error=TestJob.stderr
#SBATCH --output=TestJob.stdout

nodelist >  ./machines.LINUX
echo $SLURM_JOB_ID > ./jobid

module load gaussian/09/RevE
source ${g09root}/g09/bsd/g09.profile
export GAUSS_SCRDIR=$TMPDIR

g09 test_g98.com
