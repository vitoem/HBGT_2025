#!/bin/sh
#SBATCH -J getORF
#SBATCH -n 1
#SBATCH --mem 50000
#SBATCH -t 365-00
#SBATCH -e getORF.e%j
#SBATCH -o getORF.o%j

module load emboss/6.6.0/gcc/9.3.0-4geh

#EMBOSS
#q1 module emboss/6.6.0/gcc/9.3.0-4geh
#q2 module emboss/6.6.0/gcc/8.3.1-7aag

getorf -sequence Mira.fasta.clean -outseq MiraORF.fna -minsize 150 -maxsize 50000 -find 3 

getorf -sequence Mira.fasta.clean -outseq MiraPRT.faa -minsize 150 -maxsize 50000 -find 1 

#-------------------------------------------------------------------------------------------

getorf -sequence Trinity.fasta.clean -outseq TrinityORF.fna -minsize 150 -maxsize 50000 -find 3

getorf -sequence Trinity.fasta.clean -outseq TrinityPRT.faa -minsize 150 -maxsize 50000 -find 1 
