<!DOCTYPE html>
<html>
<body>
<h1>Carpeta 2.Paired-End_Reads</h1>
<p>Para filtrar reads pareados con base a valores de calidad determinados</p>
<p>El programa a utilizar debe garantizar mantener simpre secuencias pareadas eliminando aquellas que no cumplan con los valores asignados como umbral. En caso de que una de las secuencias sea eliminada (R1 o R2) el par correspondiente será eliminado para no retener secuencias huerfanas.</p>
<pre><code>module load q1/ngstools/master</code></pre>
<pre><code>srun -n1 --mem 16000 -p q1 qualityControl.py -1 R1.fastq -2 R2.fastq -q 20 -p 90 -a 30 -o1 HQA_R1.fastq -o2 HQA_R2.fastq</code></pre>
<p>Contar en los archivos de salida el total de secuencias y comparar vs los archivos originales; analizar en el archivo de ayuda el significado de las variables -q 20 -p 90 -a 30. Discutir la importancia de manipular correctamente dichas variables</p>
<p>Ejecute de nueva cuenta el trabajo anterior pero ahora utilizando un script de de bash(shell), vea el contenido del archivo "qualityControl.slurm" trabaje al interior del mismo y editelo utilizando vim y finalmente ejecutelo y compare la salida en razon del como afecta modificar las variable -q, -p y -a</p>
<p>Ahora realizaremos un filtro a través de ventanas móviles con Trimmomatic</p>
<pre><code>module load trimmomatic/0.38/gcc/8.3.1-jwk4</code></pre>
<p>Consultar la ayuda para estructurar el comando (utilizar los siguientes parámetros LEADING:15 TRAILING:15 SLIDINGWINDOW:4:20 MINLEN:36)</p>
<p>En ocasiones y dependiendo del tipo de adaptadores empleados para construir las bibliotecas, una vez secuenciadas las mismas, dichos adaptadores deben ser identificados y elimiados. SeqPrep es un programa escrito para tales propositos, además de remover los adaptadores, el programa tambien realiza un filtro de calidad en las lecturas y elimina reads huerfanos en caso de que alguna de las secuencias pareadas no cumpla con los criterios establecidos. SeqPrep es una herramienta también disponible el repositorio GitHub (https://github.com/jstjohn/SeqPrep)</p>
<p>NOTA: Para fines practicos, el programa SeqPrep (y sus dependencias) se encuentran en el mismo modulo de FASTX-toolkit, por lo que puede ejecutarse cargando el módulo seqprep/1.3.2/gcc/8.3.1-npl3. Antes de ejecutar el trabajo (SeqPrep.slurm), visualice la tarea, y llame despues al archivo de ayuda para interpretar las variables a utilizar.</p>
<pre><code>SeqPrep -h</code></pre>
<pre><code>sbatch SeqPrep.slurm</code></pre>
<p>Analice los archivos de error y mensajes generados como resultado de ejecutar la tarea antes mencionada.</p>
</body>
</html>
