#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=4GB
#SBATCH --partition=batch
#SBATCH --time=00:30:00
#SBATCH --error=julia_example.%J.err
#SBATCH --output=julia_example.%J.out
#SBATCH --job-name=julia_cpu_example

module load julia/1.9 cuda/12.2 


julia julia_cpu.jl
