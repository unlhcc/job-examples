#!/bin/bash
#SBATCH -J gamess
#SBATCH --nodes=2 
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=2048
#SBATCH --time=02:00:00
#SBATCH --error=TestJob.%J.stderr
#SBATCH --output=TestJob.%J.stdout

module load compiler/intel/19 openmpi/2.0
module load gamess/20210930R2

nodelist > ./PBS_NODEFILE
echo $SLURM_JOB_ID > ./jobid
export NCPUS=`wc -l < ./PBS_NODEFILE`

rm -rf ${WORK}/scr/
mkdir -p ${WORK}/scr/
rungms exam30 00 $NCPUS $SLURM_NTASKS_PER_NODE >& exam30.log
cp ${WORK}/scr/* .
