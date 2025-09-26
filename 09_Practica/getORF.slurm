#!/bin/sh
#SBATCH -J getORF
#SBATCH -n 1
#SBATCH --mem 20G
#SBATCH -t 0
#SBATCH -p q1
#SBATCH -e getORF.e%j
#SBATCH -o getORF.o%j

module load emboss/6.6.0/gcc/9.3.0-4geh

getorf -sequence Mira.fasta.clean -outseq MiraORF.fna -minsize 201 -find 2 
getorf -sequence Mira.fasta.clean -outseq MiraPRT.faa -minsize 201 -find 0 
#-------------------------------------------------------------------------------------------
getorf -sequence Trinity.fasta.clean -outseq TrinityORF.fna -minsize 201 -find 2
getorf -sequence Trinity.fasta.clean -outseq TrinityPRT.faa -minsize 201 -find 0 
#-------------------------------------------------------------------------------------------
mkdir EmbossResults
mv *ORF.fna EmbossResults
mv *PRT.faa EmbossResults
mv fastx-length.pl EmbossResults
cd EmbossResults
./fastx-length.pl MiraORF.fna >Temp 2>MiraORFStat.txt
./fastx-length.pl TrinityORF.fna >Temp 2>TrinityORFStat.txt
rm Temp
cd ..
