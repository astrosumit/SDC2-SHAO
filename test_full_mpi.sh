#!/bin/bash

# sdc2

#SBATCH --job-name=full
#SBATCH --output=/o9000/SDC2/SHAO/sumit/full_mpi_out.txt
#SBATCH --error=/o9000/SDC2/SHAO/sumit/full_mpi_err.txt
#SBATCH --partition=hw
#SBATCH --time=90:00:00 
#SBATCH --nodes=5
##SBATCH --cpus-per-task=24
#SBATCH --ntasks-per-node=24
#SBATCH --cpus-per-task=1
#SBATCH --mem=60gb
#SBATCH --export=all
##SBATCH --nodelist=hw-x86-cpu[05-09]

source /o9000/SDC2/SHAO/bashrc

start_time=`date +%s`

cd /o9000/SDC2/SHAO/sumit

#mpirun -np 120 python /o9000/SDC2/SHAO/sumit/full_mpi.py
srun --mpi=pmi2 -N 5 -n 120 python /o9000/SDC2/SHAO/sumit/full_mpi.py

end_time=`date +%s`
duration=`echo "$end_time-$start_time" | bc -l`
echo "Total runtime = $duration sec"
