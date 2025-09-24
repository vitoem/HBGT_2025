#!/bin/bash
#SBATCH -J RepeatMasker
#SBATCH -n 1
#SBATCH --mem 16G
#SBATCH -t 0
#SBATCH -e RepMask.e%j
#SBATCH -o RepMask.o%j
#SBATCH -p q1

module load repeatmasker/4.0.6/gcc/9.3.0-mw7b

RepeatMasker -q -x -gff -lib ../DeNovoTEs.fasta GenomeSequences.fasta 
