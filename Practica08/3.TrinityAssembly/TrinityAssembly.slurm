#!/bin/sh
#SBATCH -J TrinityAssembly
#SBATCH -n 8
#SBATCH --mem 200G
#SBATCH -t 365-00
#SBATCH -e TrinityAssembly.e%j
#SBATCH -o TrinityAssembly.o%j
#SBATCH -N 1
#SBATCH -p q1

#TRINITY
#q1 module trinity/2.6.6/gcc/8.3.1-vykc
#q2 module q2-trinity/2.6.6/gcc/9.1.0-e3an

module load trinity/2.6.6/gcc/8.3.1-vykc

time Trinity --seqType fq --max_memory 200G --left ../2.MiraAssembly/HQ_AllReads_R1.fastq --right ../2.MiraAssembly/HQ_AllReads_R2.fastq --CPU 8 --full_cleanup --normalize_reads
