#!/bin/sh
#SBATCH -J runAssembly
#SBATCH -n 4
#SBATCH --mem 32G
#SBATCH -t 0
#SBATCH -p q1
#SBATCH -e runAssembly.e%j
#SBATCH -o runAssembly.o%j

#q1 module
module load newbler/3.0/gcc/9.3.0-bypq

runAssembly -cpu 4 -o Assembly_v3.0 454ReadsCln10xA.fastq 454ReadsCln10xB.fna

runAssembly -cpu 4 -o Assembly_v4.0 454ReadsCln10xC.fna 454ReadsCln10xB.fna 454ReadsCln10xA.fastq

