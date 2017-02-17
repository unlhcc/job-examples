# HCCWorkshops
Tutorials for HCC workshops

This repository contains scripts, data and submit files for running many popular applications on the Holland Computing Center clusters.

Applications included:
 - BLAST - includes advanced examples
 - MATLAB
 - python
 - R - includes advanced examples

Created by: Natasha Pavlovikj and Carrie Brown



BLAST metrics:
Nucleotide: 674 KB, 3 seconds

Protein: 676 KB, 7 seconds

Blast single-threaded examples:
blast_nt_single.submit - nucleotide

Blast multi-threaded examples:
blast_aa_multi.submit - protein
blast_nt_multi.submit - nucleotide

Data:
Query = yeast.nt.fasta
Query = yeast.aa.fasta
Database = $BLAST/nt.00.*

blast/ has examples with other query and db files
