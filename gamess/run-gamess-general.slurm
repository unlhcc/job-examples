#!/bin/tcsh
#SBATCH -J gamess
#SBATCH --nodes=2 --ntasks-per-node=8
#SBATCH --mem-per-cpu=2048
#SBATCH --time=2:00:00
#SBATCH --partition=batch
#SBATCH --error=TestJob.stderr
#SBATCH --output=TestJob.stdout

module load compiler/intel/13 openmpi/1.8 
module load gamess/20141205R1

nodelist > ./PBS_NODEFILE
echo $SLURM_JOB_ID > ./jobid
set NCPUS=`wc -l < ./PBS_NODEFILE`

/util/opt/gamess/20141205R1/rungms exam30 00 $NCPUS $SLURM_NTASKS_PER_NODE >& exam30.log
