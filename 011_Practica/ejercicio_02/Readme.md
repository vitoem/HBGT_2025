<h2>Directorio /Practica11/1.Ejercicio</h2>

#Este ejercicio consisitirá en realizar un análisis de expresión diferencial. Se utilizará como referencia el transcripotoma ensamblado resultante de Trinity y las correspondientes lecturas inciales utilizadas para generar este.

#Como un primer paso y con la intención de tener multiples copias del mismo archivo en diferentes directorios, generaremos un enalce al archivo a utilizar como referencia.

<pre><code>ln -s ../../Practica10/Trinity.fasta.clean .</code></pre>

#Como en muchos de los procesos en los que se utiliza una referencia, está debe indexarse/formatearse, para dicho fin, ejecute el script 1.RSEMprepref.slurm. Visualice el contenido primero y antes de su ejecución analice las opciones que se utilizan en el archivo de ayuda. Discuta

<pre><code>sbatch 1.RSEMprepref.slurm</code></pre>

#Posteriormente, se debe realizar el mapeo de forma independiente de cada una de las diferentes bibliotecas del experimento de RNAseq. Para tal efecto ejecute el script 2.RSEMcalcexp.slurm. Visualice también su contenido.

<pre><code>sbatch 2.RSEMcalcexp.slurm</code></pre>

#Los análisis de expresión diferencial asumen que la cantidad de secuencias que son mapeadas a cada uno transcritos en la referencia, son relativas a los niveles de expresión. Por tal motivo, es necesario generar una matriz de abundancias relativas, es decir, conocer cual es el nivel de expresión de cada transcrito en cada replica o condición. El script 3.AbundanceMatrix.slurm genera una matriz de abundancias relativas en base a las cuentas esperadas que son identificadas en cada biblioteca (columnas) para cada uno de los transcritos o unigenes (renglones). Tengase en cuenta que si se busca realizar alguna normalización entre muestras, estas deberá realizarse preferentemente con datos que no hayan sido ajustados/escalados (es decir mejor usar cuetas esperadas que TPM, o FPKM).

<pre><code>sbatch 3.AbundanceMatrix.slurm</code></pre>

#Recuerde que para llevar a cabo la identificación de genes expresados diferencialmente, los tratamientos deben siempre ser comparados por pares (p.ej., Control vs TestX). Cuan significativas son estas diferencias es algo que se resuelve tras la normalización y la estimación y corrección de los valores de p (probabilidad). Son almentos dos diferentes estrategias de normalización las más utilizadas (sin embargo no son las únicas). Analice cuidadosamente el script 4.DifferentialExpression.slurm, note que diferentes archivos son aquellos requeridos para su ejecución. Analice cada uno de estos para su comprensión.

<pre><code>sbatch 4.DifferentialExpression.slurm</code></pre>

#Tras haber corrido el script, notará que los resultados son generados en un directorio (DEG) los archivos pdf, puede importarlos a su maquina local para visualizarlos. Anaice las tablas que contienen los resultados (p.ej., AbundanceMatrix.isoform.counts.matrix.cond_B_vs_cond_A.DESeq2.DE_results) y, a partir de estas seleccione los unigenes expresados diferencialmente cuyas diferencias sean significativas (padj <= 0.05).

<pre><code>awk -F"\t" '$11<=0.05 {print $1"\t"$7"\t"$11}' AbundanceMatrix.isoform.counts.matrix.cond_B_vs_cond_A.DESeq2.DE_results > TreatmentX_DEG</code></pre>
<pre><code>awk -F"\t" '$11<=0.05 {print $1"\t"$7"\t"$11}' AbundanceMatrix.isoform.counts.matrix.cond_C_vs_cond_A.DESeq2.DE_results > TreatmentY_DEG</code></pre>

#Puede generar ahora una lista que contenga únicamente los identificadores de los unigenes diferencialmente expresados y con base en ella generar un archivo fasta que contenga únicamente estas secuencias partiendo del archivo resultante del ensamblado y que fuera utilizado como referencia para el análisis de RNAseq. Tambien puede generar una lista de los descriptores de cada una de las proteínas codificadas en dichos unigenes.

<pre><code>awk -F"\t" '{print $1}' TreatmentX_DEG > TreatmentX_DEG.IDs</code></pre>
<pre><code>awk -F"\t" '{print $1}' TreatmentY_DEG > TreatmentY_DEG.IDs</code></pre>

<pre><code>module load cdbfasta/2017-03-16/gcc/9.3.0-afj3</code></pre>
<pre><code>cdbfasta ../Trinity.fasta.clean</code></pre>
<pre><code>cat TreatmentX_DEG.IDs | cdbyank ../Trinity.fasta.clean.cidx > TreatmentX_DEG.fasta</code></pre>
<pre><code>cat TreatmentY_DEG.IDs | cdbyank ../Trinity.fasta.clean.cidx > TreatmentY_DEG.fasta</code></pre>

<pre><code>grep -c ">" TreatmentX_DEG.fasta TreatmentY_DEG.fasta</code></pre>

#¿Podemos también obtener las secuencias de las proteínas correspondientes a cada uno de los DEG?...

<pre><code>cdbfasta ../../../Practica10/Trinity_Awise_prot.fas</code></pre>
<pre><code>cat TreatmentX_DEG.IDs | cdbyank ../../../Practica10/Trinity_Awise_prot.fas.cidx > TreatmentX_DEG_PRT.fasta</code></pre>

<pre><code>cat TreatmentY_DEG.IDs | cdbyank ../../../Practica10/Trinity_Awise_prot.fas.cidx > TreatmentY_DEG_PRT.fasta</code></pre>

<pre><code>grep -c ">" TreatmentX_DEG_PRT.fasta TreatmentX_DEG.fasta</code></pre>
<pre><code>grep -c ">" TreatmentY_DEG_PRT.fasta TreatmentY_DEG.fasta</code></pre>

#¿Podriamos también generar una lista de los identificadores de cada una de las proteínas de Arabidopsis que resultaron homólogas a estos unigenes?...

<pre><code>grep -Ff TreatmentX_DEG.IDs ../../../Practica10/BlastResult > DEGTreatmentXAnnotation.txt</code></pre>
<pre><code>grep -Ff TreatmentY_DEG.IDs ../../../Practica10/BlastResult > DEGTreatmentYAnnotation.txt</code></pre>




