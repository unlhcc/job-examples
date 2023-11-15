#!/bin/bash
#SBATCH -J g16
#SBATCH --nodes=1 --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000
#SBATCH --time=10:00:00
#SBATCH --partition=batch
#SBATCH --error=TestJob.stderr
#SBATCH --output=TestJob.stdout


nodelist >  ./machines.LINUX
echo $SLURM_JOB_ID > ./jobid

module load gaussian/16/RevA
source ${g16root}/g16/bsd/g16.profile

g16 test_g98.com
