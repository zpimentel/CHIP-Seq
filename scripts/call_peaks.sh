#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --exclusive

## DESCRIPTION: This job calls peaks using epic.

echo "START"
date

mkdir /data/zhanglab/zpimentel/ChIP-Seq/03_peak_calling
cd /data/zhanglab/zpimentel/ChIP-Seq/02_mapping/mapping_out

module load epic/20181121-foss-2020a

# Call peaks with epic for GM10847 cells
epic --treatment SRX017887.bed SRX017888.bed SRX017889.bed SRX017890.bed SRX017891.bed --control SRX017892.bed SRX017893.bed --genome hg38 --outfile ../../03_peak_calling/GM10847.out

# Call peaks with epic for GM15510 cells
epic --treatment SRX017875.bed SRX017876.bed SRX017877.bed SRX017878.bed SRX017879.bed --control SRX017881.bed SRX017880.bed --genome hg38 --outfile ../../03_peak_calling/GM15510.out

echo "DONE"
date
