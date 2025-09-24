#!/bin/sh
#SBATCH -J Rfam
#SBATCH -n 10 
#SBATCH --mem 75000
#SBATCH -o Rfam.o%j
#SBATCH -e Rfam.e%j
#SBATCH -p q1
#SBATCH -w nodo3

module load infernal/1.1.2/gcc/8.3.1-mnuk

time cmscan --cpu 10 --cut_ga --rfam --nohmmonly --tblout RfamResult.tblout --fmt 2 --clanin /tmp/databases/Rfam/Rfam.clanin /tmp/databases/Rfam/Rfam.cm PartialGenome.fasta > RfamResult.cmscan   


