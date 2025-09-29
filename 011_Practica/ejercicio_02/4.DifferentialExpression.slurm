#!/bin/sh
#SBATCH -J DifferentialExpression
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p q1
#SBATCH --mem 16G
#SBATCH -e DifferentialExpression.e%j
#SBATCH -o DifferentialExpression.o%j

module load r/3.6.2/gcc/9.3.0-2qky
module load trinity/2.6.6/gcc/8.3.1-vykc

#run_DE_analysis.pl --matrix AbundanceMatrix.isoform.counts.matrix --method edgeR --output DEG --samples_file SamplesDescribed.txt --contrasts Contrasts.txt
run_DE_analysis.pl --matrix AbundanceMatrix.isoform.counts.matrix --method DESeq2 --output DEG --samples_file SamplesDescribed.txt --contrasts Contrasts.txt

