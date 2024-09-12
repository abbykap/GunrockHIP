#!/bin/bash
#SBATCH -A gen150
#SBATCH -t 1:00:00
#SBATCH -N 1
#SBATCH -p batch
#SBATCH -J gunrock_sssp_gpu_only
#SBATCH -o hpctoolkit_gpu_only.out
#SBATCH -e hpctoolkit_gpu_only.err

module load ums ums023 hpctoolkit
module load rocm
export OMP_NUM_THREADS=7

# Set directories
WORKING_DIR=/lustre/orion/gen150/world-shared/abby-fall24/gunrockhip/gunrock-hip-develop/build/bin
DATA_DIR=/lustre/orion/gen150/world-shared/abby-summer24/nawsdatasets/
GRAPH_FILE=${DATA_DIR}uk-2002.mtx
MEASUREMENT_DIR=/lustre/orion/gen150/world-shared/abby-fall24/hpctoolkit_data
DATABASE_DIR=/lustre/orion/gen150/world-shared/abby-fall24/hpctoolkit_database

# Step 1: Profile GPU-only performance
srun --cpus-per-task=7 hpcrun -o $MEASUREMENT_DIR -t -e gpu=amd ${WORKING_DIR}/sssp -m ${GRAPH_FILE}

# Step 2: Analyze the GPU binary
hpcstruct $MEASUREMENT_DIR

# Step 3: Generate performance database
hpcprof -o $DATABASE_DIR $MEASUREMENT_DIR
