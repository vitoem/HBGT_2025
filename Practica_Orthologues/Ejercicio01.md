<h1> PRÁCTICA: Análisis de Ortólogos </h1>

<p>
Introducción: 
Una base de datos (BD) almacena datos y los conecta en una unidad lógica junto a los metadatos necesarios para su procesamiento1. ​Los datos generados a partir de estudios biológicos, requieren de este tipo de almacenamiento sistemático y organizado, para garantizar su acceso y gestión.​ Estas son una herramienta esencial para las distintas disciplinas ómicas.​

Las BD y diversas herramientas desarrolladas para explorarlas, permiten la búsqueda de secuencias biológicas, genes y genomas, patrones de expresión genética, variación epigenética, interacciones proteína-proteína, frecuencias de variantes, elementos reguladores y análisis comparativos entre diversos organismos.​
</p>


<pre><code>
conda activate ncbi_datasets
</code></pre>


<pre><code>
datasets summary gene symbol Or5 --taxon "Apis mellifera"​
datasets summary gene symbol Or5 --taxon "Apis mellifera" --report product​
datasets summary gene symbol Or5 --taxon "Apis mellifera" --as-json-lines |
\ dataformat tsv gene --fields symbol,gene-id,gene-type,description,tax-id​
dataformat tsv gene --help
</code></pre>


<pre><code>
datasets download gene symbol Or5 --taxon 7460​
unzip ncbi_dataset.zip​
datasets download gene symbol Or5 --taxon 7460 --include gene,rna,cds,protein
</code></pre>



<pre><code>
datasets summary genome taxon 7460  --as-json-lines​
datasets summary genome taxon 7460 –reference​
datasets summary genome taxon 7460 --annotated --as-json-lines | \​
    dataformat tsv genome \​
    --fields accession,assminfo-name,annotinfo-name,annotinfo-release-date,organism-name
</code></pre>



<pre><code>
datasets summary genome taxon 7460 –annotated​
datasets download genome taxon 7460 --annotated --include genome,cds,protein,gff3
</code></pre>





