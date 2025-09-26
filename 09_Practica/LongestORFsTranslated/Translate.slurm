#!/bin/sh
#SBATCH -J Translante
#SBATCH -n 1
#SBATCH --mem 20G
#SBATCH -t 0
#SBARCH -p q1
#SBATCH -e Translate.e%j
#SBATCH -o Translate.o%j

module load emboss/6.6.0/gcc/9.3.0-4geh
module load perl/5.30.1/gcc/9.3.0-ib6o
module load perl-bioperl/1.7.6/gcc/9.3.0-fh2w

./translate2aa.pl -m 67 ../Mira.fasta.clean > MiraORFsTranslated.fasta
./translate2aa.pl -m 67 ../Trinity.fasta.clean > TrinityORFsTranslated.fasta

