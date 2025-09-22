#!/bin/sh
#SBATCH -J busco
#SBATCH -n 1
#SBATCH --mem 16G
#SBATCH -t 0
#SBATCH -e err.%j.log
#SBATCH -o out.%j.log
#SBATCH -p q1
#SBATCH -w nodo3

module load busco/3.0.1/gcc/8.3.1-v6qn

# Si no existe el directorio de configuración, entonces:

if [[ ! -d config ]]
   then
        cp -r /lustre/apps/spack/opt/spack/linux-centos8-skylake_avx512/gcc-8.3.1/augustus-3.3.2-umjiaocposxtv2vs3ld7qaonaplsuxcy/config .
fi

MAIN_DIR=$(pwd)
export AUGUSTUS_CONFIG_PATH=${MAIN_DIR}/config

# Ejecutar BUSCO con los dos genomas bacterianos y comparar los resultados para determinar cual está más completo.

run_BUSCO.py -m genome -i Acidobacteria_bacterium.fna -o ACBA -l bacteria_odb9 -c 1

run_BUSCO.py -m genome -i Borrelia_coriaceae.fna -o BOCO -l bacteria_odb9 -c 1

