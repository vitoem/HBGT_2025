<p>Algunas plataformas de secuenciación generan los datos de salida en formato BAM (binary alignment mapping), es por ello que es importante saber manipular este tipo de datos y extraer información de secuencias y calidades. Para esto utilizaremos las herramientas de samtools y bedtools.</p>

<p>Paso 1.-  Convertiremos un archivo en formato BAM a formato SAM</p>

<pre><code>module load samtools/1.10/gcc/8.3.1-jqix</code></pre>

<pre><code>srun --mem 8G -n1 -p q2 samtools view -h -o pacbio.sam --threads 1 pacbio.bam</code></pre>

<pre><code>module purge</code></pre>

<p>Paso 2.-  A partir del archivo en formato BAM extraeremos la infromación referente a las secuencias y calidades en formato fastq.</p>

<pre><code>module load bedtools2/2.27.1/gcc/8.3.1-7tc5</code></pre>

<pre><code>srun --mem 8G -n1 -p q2 bamToFastq -i pacbio.bam -fq pacbio.fastq</code></pre>

<pre><code>module purge</code></pre>

<p>Finalmente consultaremos el tamaÃo de las lecturas del archivo fastq con a ayuda de bioawk.</p>

<pre><code>module load bioawk/1.0/gcc/8.3.1-moy3</code></pre>

<pre><code>srun --mem 8G -n1 -p q2 bioawk -c fastx '{ print $name, length($seq) }' pacbio.fastq > pacbio_length.tsv</code></pre>

<p>Podemos consultar el rango de tamaÃ±os con ayuda de los comandos head y tail</p>
<pre><code>srun --mem 8G -n1 -p q2 sort -k2,2 -n pacbio_length.tsv | head -n 1</code></pre>
<pre><code>srun --mem 8G -n1 -p q2 sort -k2,2 -n pacbio_length.tsv | tail -n 1</code></pre>

<p>También es posible determinar el tamaño promedio de las lecturas con awk</p>
<pre><code>srun --mem 8G -n1 -p q2 awk '{sum = sum + $2} END {print sum/NR}' pacbio_length.tsv</code></pre>
