# ChIP-Seq
Reanalysis of ChIP-Seq data from ENCODE of H3K9me3 in human K562 cells.

Experiment summary: https://www.encodeproject.org/experiments/ENCSR000APE/  
Control summary: https://www.encodeproject.org/experiments/ENCSR000AKY/

## Files:
sample.list: Contains the SRA ID's of the samples.

## Scripts:
./scripts/get_sra_data.sh: Downloads the samples from the SRA based on sample.list.  
./scripts/index_ref_genome.sh: Download, decompress, and index (with bowtie2) the human reference genome.
