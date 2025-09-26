#!/bin/sh
#SBATCH -J SeqClean
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 16G
#SBATCH -t 0
#SBATCH -e SeqClean.e%j
#SBATCH -o SeqClean.o%j
#SBATCH -p q1

module load seqclean/1.0/gcc/9.3.0-2hn4

seqclean Mira.fasta -l 201 -N -L -A
seqclean Trinity.fasta -l 201 -N -L -A

