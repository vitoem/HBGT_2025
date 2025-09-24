#!/bin/sh
#SBATCH -J MiraAssembly
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem 14G
#SBATCH -t 365-00
#SBATCH -e MiraAssembly.e%j
#SBATCH -o MiraAssembly.o%j
#SBATCH -p q1

module load q1/mira/4.0.2

time mira manifest.conf > log_assembly.txt

