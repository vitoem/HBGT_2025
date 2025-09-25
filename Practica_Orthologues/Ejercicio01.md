<h1> PRÁCTICA: Genómica Comparada </h1>

Iniciaremos esta práctica utilizando una herramienta de línea de comandos (CLI) desarrollada por el NCBI (National Center for Biotechnology Information), llamada ***ncbi_datasets***. Esta paqueteria permite descargar datos biológicos directamente desde las bases de datos del NCBI sin necesidad de usar un navegador web. Está pensada para trabajar de manera rápida, automatizada y reproducible con información como:
        
+ Genomas completos o parciales.
+ Secuencias de genes o proteínas.
+ Anotaciones.
+ Metadatos asociados a organismos, ensamblajes o taxones.

<p>
Para poder hacer uso de esta herramienta utilizaremos el siguiente ambiente de conda:
</p>

<pre><code>
conda activate ncbi_datasets
</code></pre>

## 1. `datasets summary gene`
Una de las primeras funciones de la herramienta (***summary***) permite generar un **resumen de información** sobre cualquier gen. La consulta del gen se puede hacer a través de accesión o incluso a través de su símbolo. Por ejemplo, si se quisira consultar información del gen con símbolo **`Or5`** de la especie ***Apis mellifera*** (abeja melífera), se podría utilizar el siguiente comando:

<pre><code>
datasets summary gene symbol Or5 --taxon "Apis mellifera" --as-json-lines | \
dataformat tsv gene --fields symbol,gene-id,gene-type,description,tax-id
</code></pre>

## 2. `datasets download gene`
Para descargar los datos relacionados con el gen **`Or5`** del taxón de ***Apis mellifera***, podemos utilizar el siguiente comnado, el cual descarga la información asociada a dicho gen en un archivo comprimido llamado **`ncbi_dataset.zip`**. 

<pre><code>
datasets download gene symbol Or5 --taxon "Apis mellifera"
unzip ncbi_dataset.zip​
</code></pre>

El comando además permite, al utilizar la opción **--include**, seleccionar la información de descarga:
<pre><code>
datasets download gene symbol Or5 --taxon 7460 --include gene,rna,cds,protein
</code></pre>

## 3. `datasets summary genome`
Otra de las funciones de datasets es la que permite generar un **resumen de los genomas disponibles** en NCBI. La información regularmente se presenta en formato **json**, con lo cual es posible generar formatos tabulares utilizando la herramienta **dataformat**

<pre><code>
datasets summary genome taxon 7460 --annotated --as-json-lines | \​
    dataformat tsv genome \​
    --fields accession,assminfo-name,annotinfo-name,annotinfo-release-date,organism-name
</code></pre>

## 4. `datasets download genome`
Para descargar genomas completos podemos utilizar el comando **datasets download genome**; la información se descargará en un archivo llamado llamado **`ncbi_dataset.zip`**. Las opciones de este comando permiten seleccionar el tipo de datos por descargar. 

<pre><code>
datasets summary genome taxon 7460 --annotated​
datasets download genome taxon 7460 --annotated --include genome,cds,protein,gff3
</code></pre>




<pre><code>
#!/bin/bash
#SBATCH -J orthofinder
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --mem 16G
#SBATCH -t 0
#SBATCH -e err_%j_orthofinder.log
#SBATCH -o out_%j_orthofinder.log
#SBATCH -p q1

module load orthofinder/2.2.0/gcc/8.3.1-mdl7 \
        diamond/0.9.25/gcc/8.3.1-p46g

orthofinder -S diamond -t 4 -a 2 -f Proteomes

</code></pre>





