#!/bin/sh
#SBATCH -J MiraAssembly
#SBATCH -n 4
#SBATCH --mem 40G
#SBATCH -t 0
#SBATCH -e MiraAssembly.e%j
#SBATCH -o MiraAssembly.o%j
#SBATCH -p q1

module load q1/mira/4.0.2

mira manifest.conf > log_assembly.txt

