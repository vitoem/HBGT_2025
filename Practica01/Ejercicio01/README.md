<!DOCTYPE html>
<html>
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
<p>NOTA:Tambien es posible utilizar comandos como head o tail para mostrar en pantalla las 10 primeras/ultimas lineas del archivo (utilizar la ayuda para mostrar ver otras opicones disponibles para estos comandos)</p>
<p>Es a menudo importante saber cuantas secuencias se encuentran contenidas en un archivo (ya sean fasta o fastq), en ambos casos, es importante encontrar caracteres específicos que formen parte de los identificadores únicos de cada una de las secuencias, dichos caracteres idealmente deben estar repetidos en todas las secuencias contenidas en el archivo. Para el nuestro ejemplo, es posible contar el número de secuencias contenidas en el archivo "IlluminaReads_NewStyle.fastq" utilizando la siguiente linea de comando</p>
<pre><code>grep -c "@NB501110" IlluminaReads_NewStyle.fastq</code></pre>
<p>Para cambiar los valores de calidad del formato ASCII (acronimo ingles de American Standard Code for Information Interchange) a valores númericos de calidad en la escala de Phred</p>
<p>ASCII: tabla de codigos (http://ascii.cl/es/)</p>
<p>Phred: valor numerico conocido como la escala de valor de calidad. Logaritmico ligado a la probabilidad de error (Phred Score = 10, probabilidad de error de lectura en esa base 1/10; Score 20, probabilidad 1/100, etc)</p>
<p>Primero habilitar el modulo que contiene los ejecutables de este ejercicio (fastx)</p>
<pre><code>module load fastx-toolkit/0.0.14/gcc/8.3.1-6qup</code></pre>
<p>FASTX-Toolkit (http://hannonlab.cshl.edu/fastx_toolkit/) es una coleccion de herramientas de linea de comandos para el preprocesamiento de archivos FASTA/FASTQ. \</p>
<p>Convertir y cambiar entre diferentes tipos de formatos, cambiar los identifiadores de las secuencias, filtrar con base a la calidad, recortar adaptadores y regiones de mala calidad son solo algunas de la herramientas disponibles.</p>
<p>Utilizar la ayuda para mostrar opciones</p>
<pre><code>fastq_quality_converter -h</code></pre>
<p>Ejecutar el siguiente trabajo en modo interactivo:</p>
<p>srun es el comando para lanzar un job interactivo con SLURM, las opciones --mem y -n son utilizadas para asignar los recursos de memoria (16GB) y de procesamiento (1 CPU) respectivamente.</p>
<pre><code>srun --mem 16000 -n 1 -p q2 fastq_quality_converter -n -Q33 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Phred.fastq</code></pre>
<p>Ver el interior del archivo y anotar los cambios en el archivo de salida en relacion con el original</p>
<p>Para cambiar el nombre o identificador de las secuencias de la version reciente a versiones anteriores</p>
<p>En este paso se empleará un porcesador de datos (awk) para realizar alguno cambios sobre el archivo de entrada.</p>
<pre><code>cat IlluminaReads_NewStyle.fastq | awk '{if (NR % 4 == 1) {split($1, arr, ":"); printf "%s_%s:%s:%s:%s:%s#0/%s (%s)\n", arr[1], arr[3], arr[4], arr[5], arr[6], arr[7], substr($2, 1, 1), $0} else if (NR % 4 == 3){print "+"} else {print $0} }' > IlluminaReads_OldStyle01.fastq</code></pre>
<p>NOTA: Tenga en cuenta que el encabezado original se agrega al final y entre parentesis. Si no desea / necesita esto, simplemente elimine el espacio y el '(% s)' justo antes del '\ n' en la linea de comando.</p>
<pre><code>cat IlluminaReads_NewStyle.fastq | awk '{if (NR % 4 == 1) {split($1, arr, ":"); printf "%s_%s:%s:%s:%s:%s#0/%s\n", arr[1], arr[3], arr[4], arr[5], arr[6], arr[7], substr($2, 1, 1), $0} else if (NR % 4 == 3){print "+"} else {print $0} }' > IlluminaReads_OldStyle02.fastq</code></pre>
<p>NOTA: Con frecuencia cuando se pretende analizar un conjunto de datos, una gran cantidad de herramientas/programas son necesarias, es importante tener en cuenta que en la mayoria de las ocasiones,</p>
<p>es posible realizar los analisis requeridos sin conocimientos amplios en lenguajes de programacion. Repositorios como github. GitHub es una plataforma de desarrollo colaborativo de software para alojar</p>
<p>proyectos utilizando el sistema de control que permite ir siguiendo las diferentes versiones/modificaciones. Los codigo fuente se almacenan y por lo general son de acceso publico.</p>
<p>Para generar los archivos fasta y qual a partir de un archivo fastq usaremos un script de phyton "convert_fastaqual_fastq.py" disponible en Qiime. Para eelo debemos de cargar el ambiente de conda qiime1-1.9.1</p>
<pre><code>conda activate qiime1-1.9.1</code></pre>
<p>Para mostar el menu de ayuda:</p>
<pre><code>python convert_fastaqual_fastq.py -h</code></pre>
<p>A partir de un archivo fastq generar los archivo fasta y qual</p>
<pre><code>srun --mem 16000 -n1 -p q2 convert_fastaqual_fastq.py -c fastq_to_fastaqual -f IlluminaReads_NewStyle.fastq</code></pre>
<p>como alternativa se puede convertir un archivo fastq a fasta con EMboss####</p>
<p>module load module load emboss/6.6.0/gcc/9.3.0-4geh</p>
<pre><code>srun --mem 8G -n1 -p q1 seqret -sequence IlluminaReads_NewStyle.fastq -outseq IlluminaReads_NewStyle.fasta</code></pre>
<p>A partir de los archivos fasta y qual, generar un archivo fastq</p>
<pre><code>srun --mem 16000 -n1 convert_fastaqual_fastq.py -c fastaqual_to_fastq -f IlluminaReads_NewStyle.fna -q IlluminaReads_NewStyle.qual</code></pre>
<p>Visualizar las diferencias entre los archivos generados</p>
<p>Para analizar la calidad de las secuencias en el archivo fastq utilie el programa FastQC.</p>
<p>Como existen modulos cargados (module list) y para evitar interferencia entre programas, es recomendable antes de cargar algun otro modulo, limpiar el ambiente de trabajo:</p>
<pre><code>module purge</code></pre>
<p>q1 module</p>
<pre><code>module load fastqc/0.11.7/gcc/9.3.0-o4ca</code></pre>
<pre><code>srun --mem 16000 -n1 -p q1 fastqc IlluminaReads_NewStyle.fastq</code></pre>
<p>Debido a que atraves de la linea de comandos no es posible visualizar archivos en ciertos formatos (p.ej. pdf, html entre otros), importe a su máquina local el archivo en formato html generado como resultado del comando previo. Una vez transferido el archivo, acceda al mismo en su maquina local.</p>
<p>Para hacer la transferencie utilice la siguiente linea de comando desde una terminal ubicada en el localhost</p>
<pre><code>rsync -av --progress --bwlimit=20000 -e 'ssh -p 49' $USUARIO@201.122.70.15:$PATH_AL_CURSO/Practica01/1.SingleEnd_Reads/*.html .</code></pre>
<p>Analice todos los datos contenidos en el archivo .html utilizando algun navegador de Internet (Google Chrome, Firefox, etc.)</p>
<p>Para Filtrar las secuencias con base a valores de calidad determinados es posible utilizar alguna de las herramientas disponible en el paquete FASTX-toolkit. Cargue el modulo correspondiente y ejecute el siguente comando</p>
<pre><code>module load fastx-toolkit/0.0.14/gcc/8.3.1-gofi</code></pre>
<pre><code>srun --mem 16000 -n1 -p q2 fastq_quality_filter -Q33 -q 30 -p 100 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Filtered01.fastq</code></pre>
<p>NOTA: Puede utilizar la ayuda para ver otras opciones disponibles, analice el significado de las variable empleadas (-q y -p)</p>
<pre><code>fastq_quality_filter -h</code></pre>
<p>Otros filtros estan disponibles dependiendo de la necesidades particulares de los datos con los que se trabaja. Ejecute la siguiente linea de comandos, analice el significado de las variables y compare/explique las salidas de ambas herramientas.</p>
<pre><code>fastq_quality_trimmer -h</code></pre>
<pre><code>srun --mem 16000 -n1 -p q2 fastq_quality_trimmer -Q33 -t 25 -l 30 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Filtered02.fastq</code></pre>
<p>Ejecute el programa FastQC para ambos archivos generados (IlluminaReads_Filtered02.fastq y IlluminaReads_Filtered02.fastq), Importe a su maquina locas los archivos de salida (.html) y analice los mismos.</p>
<p>Finalmente, también es posible utilizar otro tipo de aproximaciones para hacer el filtado de lectura, como lo son las ventanas móviles. Para ello utilizaremos el programa Trimmomatic</p>
<pre><code>module load trimmomatic/0.38/gcc/8.3.1-jwk4</code></pre>
<p>Ejecutar el comando:</p>
<pre><code>srun --mem 8G -n2 -p q1 trimmomatic SE -threads 2 -phred33 IlluminaReads_NewStyle.fastq IlluminaReads_Filtered03.fastq LEADING:15 TRAILING:15 SLIDINGWINDOW:4:20 MINLEN:36</code></pre>
<p>Se pueden realizar otros filtros modificando los parámetros de las ventanas móviles</p>
<p>Al finalizar comparar los resultados de ambas aproximaciones a través de los resultados de FastQC.</p>
</body>
</html>
