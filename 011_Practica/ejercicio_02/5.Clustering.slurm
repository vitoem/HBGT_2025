#!/bin/sh
#SBATCH -J ClusteringDE
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p q1
#SBATCH --mem 16G
#SBATCH -e ClusteringDE.e%j
#SBATCH -o ClusteringDE.o%j

module load r/3.6.2/gcc/9.3.0-2qky
module load trinity/2.6.6/gcc/8.3.1-vykc

cd DEgenes

analyze_diff_expr.pl --matrix ../AbundanceMatrix.isoform.TMM.EXPR.matrix -P 0.05 -C 2 --output HeatMap --samples ../SamplesDescribed.txt

