# Submit an R job on HCC

This script will read in an Operational Taxonomical Unit (OTU) Table (`otu_table.csv`) of microbial abundance counts and normalize them by cleaning out any missing entries, replacing zero-values with nomalinal values and then scaling all values. The normalized table is then written in a new file `normalized_otu_matrix.csv`.

To submit this job, use the command `sbatch R_single.submit`.
