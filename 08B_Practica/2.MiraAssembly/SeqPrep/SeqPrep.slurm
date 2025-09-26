#!/bin/sh
#SBATCH -J SeqPrep
#SBATCH -n 1
#SBATCH --mem 16000
#SBATCH -t 0
#SBATCH -e SeqPrep.e%j
#SBATCH -o SeqPrep.o%j
#SBATCH -p q1

module load seqprep/1.3.2/gcc/8.3.1-npl3

SeqPrep -f ../HQ_AllReads_R1.fastq -r ../HQ_AllReads_R2.fastq -1 Trimmed_HQReads_R1.fastq.gz -2 Trimmed_HQReads_R2.fastq.gz -3 Discarded_HQReads_R1.fastq.gz -4 Discarded_HQReads_R2.fastq.gz -s Merged_nHQReads.fastq.gz -L 75 -o 25
