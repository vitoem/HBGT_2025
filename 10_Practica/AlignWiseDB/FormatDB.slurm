#!/bin/bash
#SBATCH -J FormatDB
#SBATCH -n 1
#SBATCH --mem 25000
#SBATCH -t 365-00
#SBATCH -e err.format.%j
#SBATCH -o out-format.%j

module load blast-plus/2.9.0/gcc/9.3.0-zxxq

cat *.faa > plant_subset_db.faa
cat *.fna > plant_subset_db.fna

makeblastdb -in plant_subset_db.faa -dbtype prot -parse_seqids -hash_index 
makeblastdb -in plant_subset_db.fna -dbtype nucl -parse_seqids -hash_index 

