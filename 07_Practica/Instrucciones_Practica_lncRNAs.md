<!DOCTYPE html>
<html>
<body>

<h2>1)Crea un directorio que se llame 01.Practica_lncRNAs, mueve a ella los siguientes archivos:</h2>
<h1>-annotation_chr38.gtf
-genome_chr38.fa
-transcript_chr38.gtf</h1>
<p>Si ya los tienes en una carpeta aparte, omite este paso y solo cambia tu directorio de trabajo a donde se encuentren contenidos dichos archivos</p>
<p>2) crea con tu editor de texto preferido en la terminal (nano, vim) un script que se llame "Evolinc.slurm"</p>
<p>3)en el scrip copia lo siguiente:</p>
<pre><code>#!/bin/sh
#SBATCH -J EvolincI
#SBATCH -n 10
#SBATCH --mem 10000
#SBATCH -t 365-00
#SBATCH -e evolinci.e%j
#SBATCH -o evolinci.o%j
#SBATCH -p q1


#q1 module
module load evolinc-i-git/1.7.5/gcc/9.3.0-bep2

GENOMEANNOTATION=annotation_chr38.gtf
GENOME=genome_chr38.fa
TRANSCRIPTS=transcript_chr38.gtf


#####Ejecutar Evolinv-I#######

evolinc-part-I.sh -c ${TRANSCRIPTS} -g ${GENOME} -u ${GENOMEANNOTATION} -o Results -n 10</code></pre>

<p>4)guarda los cambios, carga el módulo de evolinc y abre el manual. Ejecuta el script </p>
<p>5) cambia tu directorio de "Results", explora los archivos que se generaron y revisa los archivos de error y salida (evolinci.o*, evolinci.e*)</p>

<p>6) regresa al directorio de trabajo anterior y crea un nuevo script que se llame "Sequence_lenght.slurm" y en el copia lo siguiente:</p>

<pre><code>#!/bin/bash
#SBATCH -J SeqLen
#SBATCH -n 1
#SBATCH --mem 1000
#SBATCH -t 365-00
#SBATCH -e seqlenght.e%j
#SBATCH -o seqlenght.o%j
#SBATCH -p q2


module load emboss/6.6.0/gcc/8.3.1-7aag


FILE=/lustre/mpale/03b.lncRNAs/08.Ejercicio_HBGT/02.Evolinc/Results/transcript_chr38.gtf.lincRNAs.fa

        infoseq ${FILE} -only -name -length -pgc -outfile SL_lncRNAs.txt</code></pre>
        
<p>7)Guarda los cambios y ejecuta el script. revisa el archivo que se acaba de generar</p>

<p>8)Crea un nuevo script que se llame "Gffread.slurm" y en el agrega lo siguiente:</p>

<pre><code>#!/bin/sh
#SBATCH -J Gffread
#SBATCH -n 20
#SBATCH --mem 100000
#SBATCH -t 365-00
#SBATCH -e gffread.e%j
#SBATCH -o gffread.o%j
#SBATCH -p q1

module load gffread/0.12.7/gcc/9.3.0-nllg
module load  emboss/6.6.0/gcc/9.3.0-4geh


WDIR=$(pwd)
GENOMEANNOTATION=annotation_chr38.gtf
GENOME=genome_chr38.fa
lncRNA=/lustre/mpale/03b.lncRNAs/08.Ejercicio_HBGT/02.Evolinc/Results/transcript_chr38.gtf.lincRNAs.bed


#########Extract sequences from genome

gffread -g ${GENOME} ${WDIR} -w NeighborSequences30Mb.fna --w-add 30000 ${lncRNA}</code></pre>


<p>9)ejecuta y revisa el archivo de salida</p>

<p>10) crea un nuevo script que se llame "Bedtools.slurm" y en el agrega lo siguiente:</p>

<pre><code>#!/bin/sh
#SBATCH -J Bedtools
#SBATCH -n 1
#SBATCH --mem 1000
#SBATCH -t 365-00
#SBATCH -e bedtools.e%j
#SBATCH -o bedtools.o%j
#SBATCH -p q2


#q2 module
module load bedtools2/2.27.1/gcc/8.3.1-nh4a


LNCRNA=/lustre/mpale/03b.lncRNAs/08.Ejercicio_HBGT/02.Evolinc/Results/transcript_chr38.gtf.lincRNAs.bed
GENOME=/lustre/mpale/03b.lncRNAs/08.Ejercicio_HBGT/02.Evolinc/genome_chr38.fa


#grep -w "gene" /lustre/mpale/03b.lncRNAs/08.Ejercicio_HBGT/02.Evolinc/annotation_chr38.gtf | awk '{OFS="\t"; print $1,$4-1,$5,$9,$6,$7}' > genes.bed</code></pre>

<p>11)Guarda los cambios y ejecuta. Revisa el archivo de salida</p>

<p>12) abre nuevamente el script "Bedtools.slurm" y agrega la siguiente línea (no olvides poner un # a la linea de código anterior):</p>

<pre><code>bedtools closest -a genes.bed -b ${LNCRNA}  -D b  > lncRNA_nearby_genes.txt</code></pre>

<p>13)ejecuta y revisa el archivo de salida, agrega nuevamente otra linea de codigo al script:</p>

<pre><code>#bedtools getfasta -fi ${GENOME} -bed lncRNA_nearby_genes.txt -fo NeighborGenes.fa</code></pre>

<p>14)Cuenta las líneas en el archivo lncRNA_nearby_genes.txt y cuenta cuantas secuencias hay en NeighborGenes.fa</p>
</body>
</html>
