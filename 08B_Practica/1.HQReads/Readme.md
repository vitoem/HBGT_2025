<!DOCTYPE html>
<html>
<body>
Analice el tipo de archivos a utilizar (fastq), asegurese de tener igual numero de secuencias en los correspondientes archivos de secuencias pareadas (R1 y R2). Note que el experimento de RNAseq consta de tres condiciones (Control, TreatmentX y TreatmentY) cada uno secuenciado por triplicado (replicas biológicas 01-03).

<p>Como en ocurre en muchos experimentos de RNAseq que corresponden a especies que carecen de un genoma de referencia, los contigs (unigenes) resultantes del proceso de ensamblado de novo podrán ser considerados como tal. Teniendo en cuenta este es el caso en nuestro ejercicio, para realizar el ensamblado debe concatenar todas las secuencias/lecturas R1 en único archivo y hacer lo mismo para el caso de las lecturas R2. Asegurese que tras realizar esta tarea, el orden de las secuencias R1 y R2 es el mismo en ambos archivos.</p>

<pre><code>cat ../1.HQReads/HQ_Control*_R1.fastq ../1.HQReads/HQ_TreatmentX*_R1.fastq ../1.HQReads/HQ_TreatmentY*_R1.fastq > HQ_AllReads_R1.fastq</code></pre>

<pre><code>cat ../1.HQReads/HQ_Control*_R2.fastq ../1.HQReads/HQ_TreatmentX*_R2.fastq ../1.HQReads/HQ_TreatmentY*_R2.fastq > HQ_AllReads_R2.fastq</code></pre>

<pre><code>grep -c "@NB501110" HQ_AllReads_R*.fastq</code></pre>
</body>
</html>
