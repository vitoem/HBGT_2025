<!DOCTYPE html>
<html>
<body>
<h2>En esta práctica utilizaremos un script de perl (https://github.com/KorfLab/Assemblathon/blob/master/assemblathon_stats.pl) para calcular diversar méticas de dos genomas bacterianos.</h2>
<p>1.- Primero intentaremos correr el script con uno de los dos genomas:</p>
<pre><code>srun --mem 8G -n1 -p q1 ./assemblathon_stats.pl Acidobacteria_bacterium.fna > ACBA_stats.txt</code></pre>
<p>Los mensajes indican que el script requiere definir antes de su ejecución dos variables de entorno, sin las cuales se generan alertas y errores.</p>
<pre><code>export PERL5LIB=$(pwd)</code></pre>
<pre><code>export LC_ALL=en_US.UTF-8</code></pre>
<p>Una vez que el entorno de trabajo se ha configurado correctamente se puede ejecutar el script:</p>
<pre><code>srun --mem 8G -n1 -p q1 ./assemblathon_stats.pl Acidobacteria_bacterium.fna > ACBA_stats.txt</code></pre>
<pre><code>srun --mem 8G -n1 -p q1 ./assemblathon_stats.pl Borrelia_coriaceae.fna > BOCO_stats.txt</code></pre>
</body>
</html>
