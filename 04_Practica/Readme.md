<!DOCTYPE html>
<html>
<body>
<p>Para llevar a cabo este ejercicio, utilizaremos un par de servidores en línea. Ambos son herramientas rápidas y eficientes que ayudan a minimizar significativamente los tiempos cuando se trabaja con genomas procarintes (principalmente bacterianos).</p>
<p>Las herramientas antes mencionadas son dfast y proka/proksee:</p>
<p>#https://academic.oup.com/bioinformatics/article/34/6/1037/4587587</body>p>
<p>#https://dfast.ddbj.nig.ac.jp/</html>p>
<p>#https://academic.oup.com/bioinformatics/article/30/14/2068/2390517?login=true</p>
<p>#https://proksee.ca/<p/>
<p>#Anotaremos el genoma ensamblado con MIRA en la Pratica02, para tal objeto, importe a su maquina local el archivo resultante del proceso de ensamblado.</p>
<pre><code>rsync -av --progress --bwlimit=20000 -e 'ssh -p 7850' usuario@IP:/lustre/usuario/.../archivo.fasta .</code></pre>
</body>
</html>
