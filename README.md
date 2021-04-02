# ChIP-Seq
Reanalysis of transcription factor NFKB ChIP-Seq data from DOI: 10.1126/science.1183621. Samples were selected from GM10847 and GM12892 cells for comparison (5 biological replicates each + 2 IgG controls). NFKB regulation was stimulated with TNF-α.

## Files:
sample.list: Contains the SRA ID's of the samples.

## Scripts:
./scripts/get_sra_data.sh: Downloads the samples from the SRA based on sample.list.  
./scripts/index_ref_genome.sh: Download, decompress, and index (with bowtie2) the human reference genome.  
./scripts/map_reads.sh: Map the SRA reads to the human reference genome.
