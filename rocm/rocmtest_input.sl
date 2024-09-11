#!/bin/bash
#SBATCH -A gen150
#SBATCH -t 1:00:00
#SBATCH -N 1
#SBATCH -J gunrock_bfs_uk-2002_stats
#SBATCH -o rocmtest_stats.out
#SBATCH -e rocmtest_stats.err

module load PrgEnv-gnu
module load rocm

# Set the directory paths
WORKING_DIR=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/build/bin
DATA_DIR=/lustre/orion/gen150/world-shared/abby-summer24/nawsdatasets/
GRAPH_FILE=${DATA_DIR}uk-2002.mtx

# Specify the input PCM file
INPUT_FILE=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/rocm/input.txt

# Set the output directory
OUTPUT_DIR=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/rocm/inputuk2002_3
mkdir -p $OUTPUT_DIR

rocprof -i $INPUT_FILE -o ${OUTPUT_DIR}/bfs_uk-2002_input.csv ${WORKING_DIR}/bfs -m ${GRAPH_FILE} > ${OUTPUT_DIR}/bfs_uk-2002_input_output.txt
