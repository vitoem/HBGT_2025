<!DOCTYPE html>
<html>
<body>
<h2>Carpeta /Practica09</h2>

<h2>Ejercicio-01</h2>
Copie o genere un link simbolico en su directorio actual hacia los archivos resultantes de la Practica08, es decir, los transcriptomas ensamblados generados con Mira y Trinity.

<pre><code>ln -s ../Practica08/2.MiraAssembly/Mira_assembly/Mira_d_results/Mira_out.unpadded.fasta Mira.fasta</code></pre>
<pre><code>ln -s ../Practica08/3.TrinityAssembly/trinity_out_dir.Trinity.fasta Trinity.fasta</code></pre>

Utilice el script de perl "fastx-length.pl" (https://github.com/gringer/bioinfscripts/blob/master/fastx-length.pl) para calcular algunas metricas/estadisticas simples.

<pre><code>./fastx-length.pl Mira.fasta >Temp 2>MiraStat01.txt</code></pre>
<pre><code>./fastx-length.pl Trinity.fasta >Temp 2>TrinityStat01.txt</code></pre>

Analice los resultados... Note que el umbral del tamaño en las secuencias resultantes tras el proceso de ensamblado, es distinto en ambos ensambladores. Utilice la herramienta seqclean para eliminar secuencias <200, recorte además en aquellas secuencias que los contengan elementos como: colas poly A/T, secuencias de baja complejidad y secuencias terminales rincas en bases indeterminadas (Ns). Revise el archivo de ayuda del programa seqclean para tal proposito. Al término genere nuevas métricas y compare ambos resultados.

<pre><code>sbatch SeqClean.slurm</code></pre>

<pre><code>./fastx-length.pl Mira.fasta.clean >Temp 2>MiraStat02.txt</code></pre>
<pre><code>./fastx-length.pl Trinity.fasta.clean >Temp 2>TrinityStat02.txt</code></pre>

<h2>Ejercicio-02</h2>


#Identifique marcos de lectura abiertos al interior de las contigs (unigenes) resultantes de los procesos de ensamblados.
#Utilice la herramienta "getorf" disponible en el kit de herramientas de Emboss (http://emboss.sourceforge.net/). Para dicho proposito ejecute getORF.slurm. Antes de ejecutar la tarea, visualice el contenido de dicho archvio (getORF.slurm) cargue el modulo correspondiente y lea el archivo de ayuda para interpretar las variables utilizadas

<h2>#EMBOSS</h2>

<pre><code>module purge</code></pre>

<pre><code>module load emboss/6.6.0/gcc/8.3.1-7aag</code></pre>
<pre><code>getorf --help</code></pre>
<pre><code>sbatch getORF.slurm</code></pre>

#Analice los archivos resultantes y compare

<h2>Ejercicio-03</h2>


#Para generar un archivo que contenga la secuencia proteica que corresponde al ORF mas largo identificado en cada transcrito o unigene, ejecute el script de perl tranlate2aa.pl (descargado de GitHub). El script antes mencionado requiere emboss (utiliza getOrf) y algunas bibliotecas de bioperl, por lo que debe asegurese de cargar los modulos correspondientes cuando ejecuta el script en la línea de comandos. Puede realizar esta tarea utilizando el archivo generado para el gestor de tareas (Translate.slurm).

#Ejecute preferentemente la tarea de la siguiente manera (tiempo aproximado 25 min)

<pre><code>sbatch Translate.slurm</code></pre>

#Estime las metricas para los archivos recientemente generados y compare las salidas

<pre><code>./fastx-length.pl TrinityORFsTranslated.fasta > MetricasTrinityPRT.txt</code></pre>
<pre><code>./fastx-length.pl MiraORFsTranslated.fasta > MetricasMiraPRT.txt</code></pre>
</body>
</html>
