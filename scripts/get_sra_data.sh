#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --array=1-13%13

## DESCRIPTION: This array job downloads raw reads from the NCBI SRA database.

echo "START"
date

cd /data/zhanglab/zpimentel/ChIP-Seq/01_raw_data

# Contains fastq-dump function to download reads
module load SRA-Toolkit/2.9.0-centos_linux64

# Set up array job to download the reads at the same time
# ID is now the SRA ID's we need to download
ID=$(head -n $SLURM_ARRAY_TASK_ID ../sample.list | tail -n 1 | cut -f1)

# Download the data using fastq-dump
fastq-dump --split-files $ID

echo "DONE"
date
