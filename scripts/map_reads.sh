#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --array=1-3%3

## DESCRIPTION: This array job maps reads to the human ref genome.

echo "START"
date

cd /data/zhanglab/zpimentel/ChIP-Seq/02_mapping
module load bowtie2/2.2.9-foss-2016b

# Set up array job to download the reads at the same time
# ID is now the SRA ID's we need to download
ID=$(head -n $SLURM_ARRAY_TASK_ID ../sample.list | tail -n 1 | cut -f1)

# map the reads
bowtie2 -x GRCh38 -U ../01_raw_data/${ID}_1.fastq -S ${ID}.sam --no-unal --very-sensitive-local

echo "DONE"
date
