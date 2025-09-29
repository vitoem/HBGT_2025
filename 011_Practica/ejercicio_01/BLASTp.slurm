#!/bin/bash
#SBATCH -J BLASTp
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --mem 32G
#SBATCH -t 0
#SBATCH -p q2
#SBATCH -e BLASTp.e%j
#SBATCH -o BLASTp.o%j

module load blast-legacy/2.2.22/gcc/8.3.1-2ehe

blastall -a 4 -p blastp -d TAIR10_pep_20101214.fasta -i Trinity_Awise_prot.fas -b 1 -v 1 -e 0.00001 -m 8 -o Unigenes_vs_Arabidopsis
