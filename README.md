# ChIP-Seq
Reanalysis of transcription factor NFKB ChIP-Seq data from DOI: 10.1126/science.1183621. Samples were selected from GM10847 and GM15510 cells for comparison (5 biological replicates + 2 IgG controls for each cell type). 

## Files:
sample.list: Contains the SRA ID's of the samples. Column 1: SRA ID, Column 2: Cell Type, Column 3: Sample vs. IgG Control, Column 4: Replicate #.

## Scripts:
./scripts/get_sra_data.sh: Downloads the samples from the SRA based on sample.list.  
./scripts/index_ref_genome.sh: Download, decompress, and index (with bowtie2) the human reference genome.  
./scripts/map_reads.sh: Map the SRA reads to the human reference genome.

## Steps:  
Clone the git repo and change directory into it.  
### 1. Download the reads from the SRA
```
# create directory for output
mkdir 01_raw_data  

# create directory to store slurm output files for this analysis
mkdir -p ./scripts/run/get_sra_data/ && cd ./scripts/run/get_sra_data/  

# submit script to the queue
sbatch ../get_sra_data.sh  
```

Output:  
  ./01_raw_data/*.fastq: Contains the raw fastq files downloaded from the SRA

### 2. Download and index the human reference genome
```
# create directory to store slurm output files for this analysis
mkdir ./scripts/run/index_ref_genome/ && cd ./scripts/run/index_ref_genome/  

# submit script to the queue
sbatch ../../index_ref_genome.sh  
```

Output:  
  ./02_mapping/GRCh38: Bowtie2 indexed human reference genomes  
  ./02_mapping/GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta: Human reference genome fasta file
  
### 3. Map the reads to the human reference genome  
```
# create directory to store slurm output files for this analysis
mkdir ./scripts/run/map_reads/ && cd ./scripts/run/map_reads/  

# submit script to the queue
sbatch ../../map_reads.sh  
 ```
 
Output:  
  ./02_mapping/mapping_out/\*.sam: SAM files from bowtie2 mapping of samples to human reference genome  
  ./02_mapping/mapping_out/\*.bam: BAM files from bowtie2 mapping of samples to human reference genome   
  ./02_mapping/mapping_out/\*_sorted.bam: Sorted BAM files from bowtie2 mapping of samples to human reference genome  
  ./02_mapping/mapping_out/\*.bed: BED files from bowtie2 mapping of samples to human reference genome  
  
### 4. Call peaks with epic  
```
# create directory to store slurm output files for this analysis
mkdir ./scripts/run/peak_calling/ && cd ./scripts/run/peak_calling/  

# submit script to the queue
sbatch ../../call_peaks.sh  
 ```




