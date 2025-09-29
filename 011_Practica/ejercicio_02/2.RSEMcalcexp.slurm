#!/bin/sh
#SBATCH -J RSEMcalcexp 
#SBATCH -n 1
#SBATCH -N 1
#SBAtCH -p q1
#SBATCH --mem 16G
#SBATCH -e RSEMcalcexp.e%j
#SBATCH -o RSEMcalcexp.o%j

module load rsem/1.3.1/gcc/8.3.1-ehc7

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_Control01_R1.fastq ../../Practica08/1.HQReads/HQ_Control01_R2.fastq ReferenceTrinityAssembly Control01

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_Control02_R1.fastq ../../Practica08/1.HQReads/HQ_Control02_R2.fastq ReferenceTrinityAssembly Control02

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_Control03_R1.fastq ../../Practica08/1.HQReads/HQ_Control03_R2.fastq ReferenceTrinityAssembly Control03

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentX01_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentX01_R2.fastq ReferenceTrinityAssembly TreatmentX01

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentX02_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentX02_R2.fastq ReferenceTrinityAssembly TreatmentX02

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentX03_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentX03_R2.fastq ReferenceTrinityAssembly TreatmentX03

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentY01_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentY01_R2.fastq ReferenceTrinityAssembly TreatmentY01

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentY02_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentY02_R2.fastq ReferenceTrinityAssembly TreatmentY02

rsem-calculate-expression --bowtie2 --paired-end ../../Practica08/1.HQReads/HQ_TreatmentY03_R1.fastq ../../Practica08/1.HQReads/HQ_TreatmentY03_R2.fastq ReferenceTrinityAssembly TreatmentY03
