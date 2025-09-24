<!DOCTYPE html>
<html>
<body>
<p>El archivo DeNovoTEs.fasta, es un archivo multifasta que contiene elementos transponibles que fueron identificados y categorizados con el programa REPET. Tenga en cuenta que dicho programa (REPET) no es el único comunmente utilizado para identificar/predecir elementos transponibles (TEs) de novo; otras opciones igualmente eficientes son los programas RepeatModeler o RepBox. El funcionamiento de ninguno de estos programas se mostrará durante el curso pero trabajaremos con el archivo resultante de una de estos.</p>
<p>Asumiendo que, en su mayoría, los elementos contenidos en el archivo DeNovoTEs.fasta son retrotransposones, vamos a utilizar el programa ltr-finder (https://github.com/xzhub/LTR_Finder) para analisszar su esctrucutra. Tanto el programa (un ejecutable) como Los tRNAs a utilizar se encuentran en el directorio LTR_FINDER.x86_64-1.0.5. Estos últimos (los tRNAs) fueron identificados previamente como se vió en practicas anteriores y se proporcionan en un archivo multifasta.</p>
<p>Vea las opciones, en especial con relación al tipo de formato de(los) archivos de salida.</p>
<pre><code>srun --mem 8G -n1 -p q1 ./ltr_finder -s Plant-tRNAs.fa -w 0 -x -E ../DeNovoTEs.fasta > LTRfinder_Results</code></pre>
<p>Ahora, una vez confirmada la presencia de retrotransposones y otros elementos transponibles en nuestro archivo DeNovoTEs.fasta, "enmascaremos" las regiones correspondientes utlizando el programa RepeatMasker.</p>
<p>En el directorio RepeatMasker, utilice el script de slurm para tal proposito. Antes, corrija y cambie las opicones en caso necesario.</p>
<p>Una vez enmascarado el genoma, realice la predicción de modelos génicos utilizando envidencia transcripcional (TranscriptomeAssembly.fasta tal y como se hizo en la Practica 5 (Ejercicio02). Utilice tanto el genoma enmascarado como el genoma sin enmascarar. Una vez parseados sus resultados, transfiera los archivos necesarios a su maquina local y compare utilizando JBrowse.</p>
</body>
</html>
