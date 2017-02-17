# Using BLAST on HCC Clusters

This tutorial will give an overview on how to run BLAST queries on the cluster.
Created by: Natasha Pavlovikj

Example 1: Nucleotide search using a single core
 - This example utilizes query sequences found in the `yeast.nt.fasta` file and searches it against the nucleotide database found in the Biodata module.
 - To submit this example, use the `sbatch` command to run `blast_nt_single.submit`

Example	2: Nucleotide search using multiple cores                     
 - This example utilizes the same query as Example 1, but requests multiple cores so the user can compare running time.
 - To submit this example, use the `sbatch` command to run `blast_nt_multi.submit`     

Example 3: Protein search using a custom database file
 - This example uses BLAST database indexing command `makeblastdb` to create a BLAST usable database from the fasta file `yeast.aa`
 - Then a protein alignment using query file `yeast.aa.fasta` is performed against the built database
 - To submit this example, use the `sbatch` command to run `blast_aa_multi.submit`

Additional examples can be found within the `nucleotide` or `protein` folders.





