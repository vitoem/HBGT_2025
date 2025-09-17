<!DOCTYPE html>
<html>
<body>
<p>Carpeta 2.Paired-End_Reads</p>
<p>Para filtrar reads pareados con base a valores de calidad determinados</p>
<p>El programa a utilizar debe garantizar mantener simpre secuencias pareadas eliminando aquellas que no cumplan con los valores asignados como umbral. En caso de que una de las secuencias sea eliminada (R1 o R2) el par correspondiente será eliminado para no retener secuencias huerfanas.</p>
<pre><code>module load q1/ngstools/master</code></pre>
<pre><code>srun -n1 --mem 16000 -p q1 qualityControl.py -1 R1.fastq -2 R2.fastq -q 20 -p 90 -a 30 -o1 HQA_R1.fastq -o2 HQA_R2.fastq</code></pre>
</body>
</html>
