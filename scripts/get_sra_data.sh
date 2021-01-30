#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --array=1-13%13

## DESCRIPTION: This array job downloads raw reads from the NCBI SRA database.

echo "START"
date

# Contains fastq-dump function to download reads
module load SRA-Toolkit/2.9.0-centos_linux64

cd /data/zhanglab/zpimentel/ChIP-Seq/01_raw_data

# Set up array job to download the reads at the same time
# Only run this on human samples - drop the fly samples
# ID is now the SRA ID's we need to download
ID=$(head -n $SLURM_ARRAY_TASK_ID <(grep "Homo sapiens" ../SRA_Metadata.txt) | tail -n 1 | cut -f1 -d",")

# Download the data using fastq-dump
fastq-dump --split-files $ID

echo "DONE"
date
