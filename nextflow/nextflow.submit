#!/bin/bash 
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=01:00:00
#SBATCH --mem=1GB
#SBATCH --job-name=nextflow
#SBATCH --error=nextflow.%J.err
#SBATCH --output=nextflow.%J.out
#SBATCH --partition=batch

module purge
module load nextflow

nextflow run hello.nf -c config 
