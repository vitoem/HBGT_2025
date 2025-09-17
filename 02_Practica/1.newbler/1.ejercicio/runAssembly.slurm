#!/bin/sh
#SBATCH -J runAssembly
#SBATCH -n 4
#SBATCH --mem 32000
#SBATCH -t 365-00
#SBATCH -e runAssembly.e%j
#SBATCH -o runAssembly.o%j
#SBATCH -p q1



#q1 module
module load newbler/3.0/gcc/9.3.0-bypq

#A continuacion este script muestra dos lineas de comando que pueden ejecutarse. Antes de hacer este ejercicio, cargue el module y revise la ayuda. Discuta en funcion de los archivos que puede ver en su carpeta y las lineas de comando aqui especificadas y, en la medida de lo posible asegurese de que la cobertura o profundidad sea la deseada. Para dicho fin el script a utilizar fue descargado de https://github.com/gringer/bioinfscripts/blob/master/fastx-length.pl.

runAssembly -cpu 4 -o Assembly_v1.0 454ReadsCln10xA.fna

#runAssembly -cpu 4 -o Assembly_v2.0 454ReadsCln10xA.fna 454ReadsCln10xB.fna

