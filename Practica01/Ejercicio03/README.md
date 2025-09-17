<h1> Carpeta 3.454_Reads </h1>
<p>Cargar el modulo de newbler (utilizar el comando "module avail" para mostrar los módulos disponibles) y ejecutar las siguientes lineas de comando</p>

<pre><code>srun --mem 16000 -n1 -p q1 sffinfo -s GJ40EWU01.sff > GJ40EWU01.fasta</code></pre>
<pre><code>srun --mem 16000 -n1 -p q1 sffinfo -q GJ40EWU01.sff > GJ40EWU01.qual</code></pre>

<p>Solicite el archivo de ayuda para conocer otras variables disponibles del programa sffinfo, vea el interior de los archivos para reconocer sus formatos y la informacion contenida en estos y finalmente genere un archivo fastq a partir de los archivos generados (si olvido la manera de hacerlo, consulte el archivo Ejercicio01.txt disponible para esta practica).</p>
