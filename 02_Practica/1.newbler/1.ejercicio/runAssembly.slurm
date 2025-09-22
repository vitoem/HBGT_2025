#!/bin/sh
#SBATCH -J runAssembly
#SBATCH -n 4
#SBATCH --mem 32G
#SBATCH -t 0
#SBATCH -p q1
#SBATCH -e runAssembly.e%j
#SBATCH -o runAssembly.o%j


module load newbler/3.0/gcc/9.3.0-bypq

runAssembly -cpu 4 -o Assembly_v1.0 454ReadsCln10xA.fna

runAssembly -cpu 4 -o Assembly_v2.0 454ReadsCln10xA.fna 454ReadsCln10xB.fna

