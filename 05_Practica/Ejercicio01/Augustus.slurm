#!/bin/bash
#SBATCH -J Augustus
#SBATCH -n 1
#SBATCH --mem 25G
#SBATCH -t 0
#SBATCH -p q1
#SBATCH -e Augustus.e%j
#SBATCH -o Augustus.o%j

module load augustus/3.4.0/gcc/9.3.0-chpq 

augustus --species=tomato --strand=both --alternatives-from-sampling=false --UTR=off --uniqueGeneId=true --codingseq=true --gff3=on GenomeSequence.fasta > AbInitioGeneModelsNoIsoforms_v1.0.gff

augustus --species=tomato --strand=both --alternatives-from-sampling=true --UTR=off --uniqueGeneId=true --codingseq=true --gff3=on GenomeSequence.fasta > AbInitioGeneModelsIsoforms_v1.0.gff

