#!/bin/bash
#SBATCH --job-name=Neurodocker_FSL_bet_example
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --time=168:00:00
#SBATCH --error=Neurodocker_FSL_bet.%J.err
#SBATCH --output=Neurodocker_FSL_bet.%J.out

module purge
module load apptainer

# Test input data is downloaded from https://open.win.ox.ac.uk/pages/fslcourse/website/downloads.html

# To check the options for bet, run bet --help
# bet <input> <output> [options]
apptainer run docker://unlhcc/neurodocker-fsl bet \
    ./data/STRUCT.nii.gz STRUCT_brain.nii.gz -m
