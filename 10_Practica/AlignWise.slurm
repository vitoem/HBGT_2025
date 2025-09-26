#!/bin/bash
#SBATCH -J AlignWise
#SBATCH -n 20
#SBATCH -N 1
#SBATCH --mem 75G
#SBATCH -t 0
#SBATCH -e AlignWise.e%j
#SBATCH -o AlignWise.o%j
#SBATCH -p q1

module load q1/alignwise/master

#Lanzar AlignWise utilizando las bases de datos AlingWiseDB/plant_subset_db*
#NOTA: Esta base de datos contiene las proteinas de únicamente 8 species de plantas angiospermas (Amborella trichopoda, Asparagus officinalis, Macadamia integrifolia, Solanum lycopersicum, Arabidopsis thaliana, Chenopodium quinoa, Nymphaea colorata & Vitis vinifera). Usualmente en solemos utilizar tantas especies como sea posible, incluso dependiendo del objetivo puede considerar aquellas especies disponibles en genbank cuyo genoma ha sido anotado con un mismo pipeline (NCBI Eukaryotic Genome Annotation Pipeline).Haciendo uso de la cantidad de recursos computacionales especificados este proceso demora aprox. 1 hr y 30 min.

AlignWise.pl -p AlignWiseDB/plant_subset_db.faa -n AlignWiseDB/plant_subset_db.fna -T 20 Trinity.fasta.clean
