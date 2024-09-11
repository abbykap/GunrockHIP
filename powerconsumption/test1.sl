#!/bin/bash
#SBATCH --job-name=gunrock_power_monitor
#SBATCH --output=power_log.txt
#SBATCH --partition=batch
#SBATCH -A gen150            
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --time=00:10:00

# Run Gunrock application in the background
./bin/sssp -m /lustre/orion/gen150/world-shared/abby-summer24/nawsdatasets/webbase-1M.mtx -s 0 -n 10 --validate &

# Get the process ID of the last background process
PID=$!

# Monitor and record power consumption until the Gunrock application finishes
while kill -0 $PID 2>/dev/null; do
    rocm-smi --showpower | tee -a power_log.txt
    sleep 1
done
