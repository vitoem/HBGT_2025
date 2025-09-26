<!DOCTYPE html>
<html>
<body>
<h2> Carpeta ../Practica08/02.MiraAssembly </h2>
Recordemos que algunos ensambladores como es el caso de MIRA, permiten el uso de secuencias SE y PE, se asume que las secuencias SE en algunas ocasiones pueden ser secuencias más largas y es posible generarlas a partir de secuencias pareadas uniendo ambos extremos R1 y R2. Esta tarea mejora el ensamblado y reduce los tiempos de calculo, para hacer dicho ejercicio utilizaremos el programa SeqPre (SeqPrep.slurm). Antes de ejecutar el trabajo (aprox 5 min), analicemos las opciones a considerar en el mismo.

Ahora tiene como resultado, secuencias SE que provienen de la fusión de R1 y R2 y secuencias PE, que son todas aquellas que no encontraron una región de sobrelapamiento acorde con el umbral especificado. Analice los archivos de salida y los correspondientes mensajes en los archivos *.e* y *.o*. 

Actualmente usted esta ya familiarizado con el uso del ensamblador Mira, analice el archivo manifest.conf y la correspondiente tarea antes de ejecutar archivo *.slurm. Es posible que requiera descomprimir los archivos a utilizar.

Ejecutar esta tarea tomara aproximadamente 2.5 hrs, en caso de haber los recursos disponible, incremente el numero de procesadores y la memoria para reducir los tiempos

<h2>Analicemos los resultados!</h2>
</body>
</html>
