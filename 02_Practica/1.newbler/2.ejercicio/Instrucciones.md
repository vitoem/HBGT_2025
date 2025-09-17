<h1>Carpeta ../1.Newbler/Ejercicio02</h1>
<p>En ocasiones, para generear los ensamblados de genomas completos, se aprovechan las ventajas que ofertan las diferentes plataformas de secuenciación. En su mayoría (aunque no en todosos casos) los ensambladores pueden combinar datos generados a partir de diferentes plataformas (ensamblados híbridos).</p>

<p>El siguiente ejecicio tiene como objeto el demostrar que el formato de los archivos no tiene ninguna influencia en el resultado generado, no así la cobertura, la longitud y la calidad de las secuencias. Copie en su directorio actual los archivos fasta y qual empleados en el ejercicio anterior. Convierta únicamente uno de los set de datos (454ReadsCln10x o 454ReadsCln20x) en un único archivo fastq</p>

<pre><code>conda activate qiime1-1.9.1</code></pre>

<pre><code>srun --mem 16000 -n1 convert_fastaqual_fastq.py -c fastaqual_to_fastq -f 454ReadsCln10xA.fna -q 454ReadsCln10xA.qual</code></pre>

<p>Una vez realizado lo anterior ejecute la tarea "runAssembly.slurm" y compare los resultado con aquellos generados en el Ejercicio01</p>

<p>Finalmente ejecute una vez mas la tarea incrementando la cobertura mediante la incorporacion del archivo 454ReadsCln10xC.fna</p>

