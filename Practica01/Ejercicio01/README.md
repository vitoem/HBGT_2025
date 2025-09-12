<body>
  <h2>Ejercicio01 - Bash Instructions</h2>
  <p>Primer ejercicio de la práctica 01</p>
  <pre><code>mkdir Ejercicio01</code></pre>
  <pre><code>cd Ejercicio01</code></pre>

  <h1>Carpeta 1.SingleEnd</h1>
  <p>Para descomprimir y comprimir archivos en formato .gz<\p>
  <pre><code>gunzip -h</code></pre>
  <p>(Utilizar la ayuda para mostrar opciones)<\p>

  <p>Descomprimir</p>
  <pre><code>srun --mem 8G -n1 -p q1 gunzip IlluminaReads_NewStyle.fastq.gz</code></pre>

  <p>Comprimir</p>
  <pre><code>srun --mem 8G -n1 -p q1 gzip IlluminaReads_NewStyle.fastq</code></pre>

<p>Para ver el contenido del archivo "IlluminaReads_NewStyle.fastq"<\p>
<p>(presione la tecla q para salir del visualizador)<\p>
<pre><code>less Archivo.fastq<\code><\pre>
<p>NOTA:Tambien es posible utilizar comandos como head o tail para mostrar en pantalla las 10 primeras/ultimas lineas del archivo (utilizar la ayuda para mostrar ver otras opicones disponibles para estos comandos)<\p>

<p>Es a menudo importante saber cuantas secuencias se encuentran contenidas en un archivo (ya sean fasta o fastq), en ambos casos, es importante encontrar caracteres específicos que formen parte de los identificadores únicos de cada una de las secuencias, dichos caracteres idealmente deben estar repetidos en todas las secuencias contenidas en el archivo. Para el nuestro ejemplo, es posible contar el número de secuencias contenidas en el archivo "IlluminaReads_NewStyle.fastq" utilizando la siguiente linea de comando<\p>
<pre><code>grep -c "@NB501110" IlluminaReads_NewStyle.fastq<\code><\pre>

<p>Para cambiar los valores de calidad del formato ASCII (acronimo ingles de American Standard Code for Information Interchange) a valores númericos de calidad en la escala de Phred<\p>
<p>ASCII: tabla de codigos (http://ascii.cl/es/)<\p>
<p>Phred: valor numerico conocido como la escala de valor de calidad. Logaritmico ligado a la probabilidad de error (Phred Score = 10, probabilidad de error de lectura en esa base 1/10; Score 20, probabilidad 1/100, etc)<\p>

<p>Primero habilitar el modulo que contiene los ejecutables de este ejercicio (fastx)<\p>
<pre><code>module load fastx-toolkit/0.0.14/gcc/8.3.1-6qup<\code><\pre>

<p>FASTX-Toolkit (http://hannonlab.cshl.edu/fastx_toolkit/) es una coleccion de herramientas de linea de comandos para el preprocesamiento de archivos FASTA/FASTQ.<\p>
<p>Convertir y cambiar entre diferentes tipos de formatos, cambiar los identifiadores de las secuencias, filtrar con base a la calidad, recortar adaptadores y regiones de mala calidad son solo algunas de la herramientas disponibles.<\p>

<p>Utilizar la ayuda para mostrar opciones<\p>
<pre><code>fastq_quality_converter -h<\code><\pre>

<p>Ejecutar el siguiente trabajo en modo interactivo:<\p>
<pre><code>srun es el comando para lanzar un job interactivo con SLURM, las opciones --mem y -n son utilizadas para asignar los recursos de memoria (16GB) y de procesamiento (1 CPU) respectivamente.<\code><\pre>
<pre><code>srun --mem 16000 -n 1 -p q2 fastq_quality_converter -n -Q33 -i IlluminaReads_NewStyle.fastq -o IlluminaReads_Phred.fastq<\code><\pre>
<p>Ver el interior del archivo y anotar los cambios en el archivo de salida en relacion con el original<\p>

</body>
</html>
