<!DOCTYPE html>
<html>
<body>
<h2>En la medida de lo posible instale en su equipo local el programa JBrowse. Para su descarga, utilice el siguiente link:</h2>

<p>https://jbrowse.org/jb2/download/</p>
<p>Una vez instalado, comencemos con el ejercicio. Se utilizará el programa "augustus" para llevar a cabo la predicción de modelos génicos en el genoma (GenomeSequences.fasta).</p>
<p>Si bien se proporciona un script que puede ser gestionado por slurm, es fundamental revise la ayuda del programa augustus y modifique el script según las instrucciones. Se generarán incialmente dos predicciones ab initio, la primera de ellas evitando identificar posibles isoformas y la segunda incluyendo estas últimas.</p>
<pre><code>module load </code></pre>
<p>Apartir de al menos uno de los archivos de salida (formato gff extendido) extraiga tanto las secuencias codificantes (CDS) como sus correspondientes proteínas traducidas. Utilice el siguiente script para tal propósito (asegurese de tener cargado el módulo correspondiente).</p>
<pre><code>srun --mem 16000 -n1 -p q1 getAnnoFasta.pl AbInitioGeneModelsNoIsoforms_v1.0.gff</code></pre>
<p>Una vez obtenido el(los) resultado(s) (archivos gff) será importante "parsear" el resultado para eliminar comentarios en los archivos resultantes. Puede utilizar las siguentes líneas de comando para tal propósito.</p>
<pre><code>grep -v "#" AbInitioGeneModelsNoIsoforms_v1.0.gff > AbInitioGeneModelsNoIsoforms_v1.1.gff</code></pre>
<pre><code>grep -v "#" AbInitioGeneModelsIsoforms_v1.0.gff > AbInitioGeneModelsIsoforms_v1.1.gff</code></pre>
<p>Transfiera los siguientes archivos a su equipo local: GenomeSequence.fasta, AbInitioGeneModels*_v1.1.gff. Utilice JBrowse para analizar el resultado, identifique las diferencias y discuta las mismas.</p>
</body>
</html>
