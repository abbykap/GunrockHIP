#!/bin/bash
#SBATCH -A gen150
#SBATCH -t 1:00:00
#SBATCH -N 1
#SBATCH -p batch
#SBATCH -J gunrock_sssp_uk-2002_stats
#SBATCH -o rocmtest_statsuk.out
#SBATCH -e rocmtest_statsuk.err

module load PrgEnv-gnu
module load rocm
module load boost
export OMP_NUM_THREADS=7
echo "Using $OMP_NUM_THREADS threads"

# Set the directory paths
WORKING_DIR=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/build/bin
DATA_DIR=/lustre/orion/gen150/world-shared/abby-summer24/nawsdatasets/
GRAPH_FILE=${DATA_DIR}uk-2002.mtx

# Set the output directory for SSSP output and ROCprof profiling data
OUTPUT_DIR=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/rocm/uk-2002_sssp
PROFILING_DIR=${OUTPUT_DIR}/profiling
mkdir -p $OUTPUT_DIR
mkdir -p $PROFILING_DIR

# Run rocprof with srun and save SSSP output and profiling results
srun --cpus-per-task=7 rocprof --stats -i input.txt -d $PROFILING_DIR ${WORKING_DIR}/sssp -m ${GRAPH_FILE} > ${OUTPUT_DIR}/sssp_uk-2002_rocmstats.csv
