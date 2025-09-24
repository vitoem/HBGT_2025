#!/bin/sh
#SBATCH -J Translante
#SBATCH -n 1
#SBATCH --mem 50000
#SBATCH -t 365-00
#SBATCH -e Translate.e%j
#SBATCH -o Translate.o%j

module load emboss/6.6.0/gcc/9.3.0-4geh
module load perl/5.30.1/gcc/9.3.0-ib6o
module load perl-bioperl/1.7.6/gcc/9.3.0-fh2w

#EMBOSS
#q1 module emboss/6.6.0/gcc/9.3.0-4geh
#q2 module emboss/6.6.0/gcc/8.3.1-7aag

#PerlLib
#q1 module perl/5.30.1/gcc/9.3.0-ib6o
#q2 module  perl/5.30.1/gcc/8.3.1-fdij

perl translate2aa.pl -m 150 Mira.fasta.clean > MiraORFsTranslated.fasta
perl translate2aa.pl -m 150 Trinity.fasta.clean > TrinityORFsTranslated.fasta

