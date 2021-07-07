#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --exclusive

## DESCRIPTION: This job downloads and creates and index of the human reference genome.

echo "START"
date

cd /data/zhanglab/zpimentel/ChIP-Seq
mkdir 02_mapping && cd 02_mapping
mkdir mapping_out # for mapping output in next array job

module load Bowtie2/2.4.2-GCC-9.3.0

# Download & decompress the human reference genome from ENCODE
wget https://www.encodeproject.org/files/GRCh38_no_alt_analysis_set_GCA_000001405.15/@@download/GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta.gz
gunzip GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta.gz

# Index the reference genome with bowtie2
bowtie2-build --threads $SLURM_NTASKS_PER_NODE GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta GRCh38

echo "DONE"
date
