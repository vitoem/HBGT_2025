#!/bin/bash
#SBATCH -J Augustus
#SBATCH -n 1
#SBATCH --mem 25G
#SBATCH -t 0
#SBATCH -p q1
#SBATCH -e Augustus.e%j
#SBATCH -o Augustus.o%j


module load blat/35/gcc/9.3.0-rhki
module load kentutils/302.1/gcc/9.3.0-ctmb
module load augustus/3.4.0/gcc/9.3.0-chpq 


blat -minIdentity=80 GenomeSequence.fasta TranscriptomeAssembly.fasta TrainingSet.psl

pslCDnaFilter -maxAligns=1 TrainingSet.psl TrainingSet.f.psl

blat2hints.pl --in=TrainingSet.f.psl --out=TrainingSet_hints.E.gff

augustus --species=tomato --hintsfile=TrainingSet_hints.E.gff --extrinsicCfgFile=extrinsic.M.RM.E.W.cfg --UTR=off --alternatives-from-evidence=false --uniqueGeneId=true --codingseq=true --gff3=on GenomeSequence.fasta > mRNAevidenceGeneModelsNoIsoforms_v1.0.gff


#Tengase en cuenta que cuando se instala AUGUSTUS, en la carpeta config/extrinsic/ vienen varios archivos listos (por ejemplo):
#	extrinsic.M.RM.E.W.cfg
#	extrinsic.M.RM.cfg
#	extrinsic.E.RM.cfg
#	extrinsic.ME.cfg

#Cada uno está configurado para diferentes combinaciones de fuentes de evidencia

# M manual anchor (required)
# P protein database hit
# E EST/cDNA database hit
# C combined est/protein database hit
# D Dialign
# R retroposed genes
# T transMapped refSeqs
# W wiggle track coverage info from RNA-Seq
