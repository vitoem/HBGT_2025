  <body>
    <h1>Carpeta 1.SingleEnd</h1>
    <p>Para descomprimir y comprimir archivos en formato .gz</p>
    <p>(Utilizar la ayuda para mostrar opciones)</p>
    <pre><code>gunzip -h</code></pre>

    <p>Descomprimir</p>
    <pre><code>srun --mem 8G -n1 -p q1 gunzip IlluminaReads_NewStyle.fastq.gz</code></pre>

    <p>Comprimir</p>
    <pre><code>srun --mem 8G -n1 -p q1 gzip IlluminaReads_NewStyle.fastq</code></pre>

    <p>Para ver el contenido del archivo "IlluminaReads_NewStyle.fastq"</p>
    <p>(presione la tecla q para salir del visualizador)</p>
    <pre><code>less Archivo.fastq</code></pre>

    <p>NOTA: También es posible utilizar comandos como head o tail para mostrar en pantalla las 10 primeras/últimas líneas del archivo (utilizar la ayuda para mostrar ver otras opciones disponibles para estos comandos)</p>

    <p>Es a menudo importante saber cuántas secuencias se encuentran contenidas en un archivo (ya sean fasta o fastq)...</p>
    <pre><code>grep -c "@NB501110" IlluminaReads_NewStyle.fastq</code></pre>

    <p>Para cambiar los valores de calidad del formato ASCII... a valores numéricos de calidad en la escala de Phred</p>
    <p>ASCII: tabla de códigos (http://ascii.cl/es/)</p>
    <p>Phred: valor numérico conocido como la escala de valor de calidad...</p>
    <p>Primero habilitar el módulo que contiene los ejecutables de este ejercicio (fastx)</p>
    <pre><code>module load fastx-toolkit/0.0.14/gcc/8.3.1-6qup</code></pre>

    <p>FASTX-Toolkit (...) es una colección de herramientas...</p>
    <p>Utilizar la ayuda para mostrar opciones</p>
    <pre><code>fastq_quality_converter -h</code></pre>

    <p>Ejecutar el siguiente trabajo en modo interactivo:</p>
    <p>srun es el comando para lanzar un job interactivo con SLURM...</p>
    <pre><code>srun --mem 16000 -n 1 -p q2 fastq_quality_converter -n -Q33 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Phred.fastq</code></pre>

    <p>Ver el interior del archivo y anotar los cambios...</p>

    <p>Para cambiar el nombre o identificador de las secuencias...</p>
    <pre><code>cat IlluminaReads_NewStyle.fastq | awk '{if (NR % 4 == 1) {split($1, arr, ":"); printf "%s_%s:%s:%s:%s:%s#0/%s (%s)\n", arr[1], arr[3], arr[4], arr[5], arr[6], arr[7], substr($2, 1, 1), $0} else if (NR % 4 == 3){print "+"} else {print $0} }' > IlluminaReads_OldStyle01.fastq</code></pre>

    <p>NOTA: Tenga en cuenta que el encabezado original se agrega al final...</p>
    <pre><code>cat IlluminaReads_NewStyle.fastq | awk '{if (NR % 4 == 1) {split($1, arr, ":"); printf "%s_%s:%s:%s:%s:%s#0/%s\n", arr[1], arr[3], arr[4], arr[5], arr[6], arr[7], substr($2, 1, 1), $0} else if (NR % 4 == 3){print "+"} else {print $0} }' > IlluminaReads_OldStyle02.fastq</code></pre>

    <p>NOTA: Con frecuencia cuando se pretende analizar un conjunto de datos...</p>
    <p>Para generar los archivos fasta y qual a partir de un archivo fastq...</p>
    <pre><code>conda activate qiime1-1.9.1</code></pre>

    <p>Para mostrar el menú de ayuda:</p>
    <pre><code>python convert_fastaqual_fastq.py -h</code></pre>

    <p>A partir de un archivo fastq generar los archivo fasta y qual</p>
    <pre><code>srun --mem 16000 -n1 -p q2 convert_fastaqual_fastq.py -c fastq_to_fastaqual -f IlluminaReads_NewStyle.fastq</code></pre>

    <p>como alternativa se puede convertir un archivo fastq a fasta con EMboss</p>
    <pre><code>srun --mem 8G -n1 -p q1 seqret -sequence IlluminaReads_NewStyle.fastq -outseq IlluminaReads_NewStyle.fasta</code></pre>

    <p>A partir de los archivos fasta y qual, generar un archivo fastq</p>
    <pre><code>srun --mem 16000 -n1 convert_fastaqual_fastq.py -c fastaqual_to_fastq -f IlluminaReads_NewStyle.fna -q IlluminaReads_NewStyle.qual</code></pre>

    <p>Visualizar las diferencias entre los archivos generados</p>

    <p>Para analizar la calidad de las secuencias en el archivo fastq utilice el programa FastQC.</p>
    <p>Como existen módulos cargados...</p>
    <pre><code>module purge</code></pre>
    <pre><code>module load fastqc/0.11.7/gcc/9.3.0-o4ca</code></pre>
    <pre><code>srun --mem 16000 -n1 -p q1 fastqc IlluminaReads_NewStyle.fastq</code></pre>

    <p>Debido a que a través de la línea de comandos no es posible visualizar archivos en ciertos formatos...</p>
    <pre><code>rsync -av --progress --bwlimit=20000 -e 'ssh -p 49' $USUARIO@201.122.70.15:$PATH_AL_CURSO/Practica01/1.SingleEnd_Reads/*.html .</code></pre>

    <p>Analice todos los datos contenidos en el archivo .html utilizando algún navegador...</p>

    <p>Para filtrar las secuencias con base a valores de calidad determinados...</p>
    <pre><code>module load fastx-toolkit/0.0.14/gcc/8.3.1-gofi</code></pre>
    <pre><code>srun --mem 16000 -n1 -p q2 fastq_quality_filter -Q33 -q 30 -p 100 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Filtered01.fastq</code></pre>
    <pre><code>fastq_quality_filter -h</code></pre>
    <pre><code>fastq_quality_trimmer -h</code></pre>
    <pre><code>srun --mem 16000 -n1 -p q2 fastq_quality_trimmer -Q33 -t 25 -l 30 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Filtered02.fastq</code></pre>

    <p>Ejecute el programa FastQC para ambos archivos generados...</p>

    <p>Finalmente, también es posible utilizar otro tipo de aproximaciones...</p>
    <pre><code>module load trimmomatic/0.38/gcc/8.3.1-jwk4</code></pre>
    <pre><code>srun --mem 8G -n2 -p q1 trimmomatic SE -threads 2 -phred33 IlluminaReads_NewStyle.fastq IlluminaReads_Filtered03.fastq LEADING:15 TRAILING:15 SLIDINGWINDOW:4:20 MINLEN:36</code></pre>

    <p>Se pueden realizar otros filtros modificando los parámetros de las ventanas móviles</p>
    <p>Al finalizar comparar los resultados de ambas aproximaciones a través de los resultados de FastQC.</p>
  </body>
</html>
