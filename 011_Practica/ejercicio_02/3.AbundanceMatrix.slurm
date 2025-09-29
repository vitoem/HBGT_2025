#!/bin/sh
#SBATCH -J AbundanceMatrix
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 25G
#SBATCH -p q1
#SBATCH -e AbundanceMatrix.e%j
#SBATCH -o AbundanceMatrix.o%j

module load rsem/1.3.1/gcc/8.3.1-ehc7
module load trinity/2.6.6/gcc/8.3.1-vykc


abundance_estimates_to_matrix.pl --est_method RSEM --gene_trans_map 'none'  --cross_sample_norm TMM \
 --out_prefix AbundanceMatrix Control01.genes.results Control02.genes.results Control03.genes.results TreatmentX01.genes.results TreatmentX02.genes.results TreatmentX03.genes.results TreatmentY01.genes.results TreatmentY02.genes.results TreatmentY03.genes.results
