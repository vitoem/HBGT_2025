<!DOCTYPE html>
<html>
<body>
<p>En ocasiones, para generear (y mejorar) los ensamblados de genomas completos, se aprovechan las ventajas que ofertan las diferentes plataformas de secuenciación. En su mayoría (aunque no en todosos casos) los ensambladores pueden combinar datos generados a partir de diferentes plataformas (ensamblados híbridos).</p>
<p>El siguiente ejecicio tiene como objeto el demostrar que el formato de los archivos no tiene ninguna influencia en el resultado generado, no así la cobertura, la longitud y la calidad de las secuencias. Utilice los archivos empleados en el ejercicio anterior. Convierta únicamente uno de los set de datos (454ReadsCln10xA o 454ReadsCln10xB) en un único archivo fastq. En la medida de lo posible trate de evitar generar archivos redundantes en su directorio actual de trabajo.</p>

<pre><code>conda activate qiime1-1.9.1</code></pre>
<pre><code>srun --mem 16G -n1 -p q1 convert_fastaqual_fastq.py -c fastaqual_to_fastq -f ../Ejercicio01/454ReadsCln10xA.fna -q ../Ejercicio01/454ReadsCln10xA.qual</code></pre>
<pre><code>ln -s ../Ejercicio01/454ReadsCln10xB.fna</code></pre>
<pre><code>ln -s ../Ejercicio01/454ReadsCln10xB.qual</code></pre>


<p>Una vez realizado lo anterior ejecute la tarea "runAssembly.slurm" utilizando una cobertura 20x (archivos A y B) y una cobertura 30x (Archivos A, B y C). Compare los resultado con aquellos generados en el Ejercicio01</p>
</body>
</html>
