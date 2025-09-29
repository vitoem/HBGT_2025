#!/bin/sh
#SBATCH -J RSEMprepref 
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16G
#SBATCH -p q1
#SBATCH -e RSEMprepref.e%j
#SBATCH -o RSEMprepref.o%j

module load rsem/1.3.1/gcc/8.3.1-ehc7

rsem-prepare-reference --bowtie2 Trinity.fasta.clean ReferenceTrinityAssembly
