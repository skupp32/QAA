#!/bin/bash
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=trimmomatic%j    ### job name
#SBATCH --output=trimmomatic.out    ### file in which to store job stdout
#SBATCH --error=trimmomatic.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### number of nodes to request
#SBATCH -A bgmp                ### account
#SBATCH --cpus-per-task=10      ### number of cores/CPUs

conda activate QAA

trimmomatic PE /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/23_4A_control_S17_L008_R1_001.cut.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/23_4A_control_S17_L008_R2_001.cut.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/23_4A_control_S17_L008_R1_001.cut.paired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/23_4A_control_S17_L008_R1_001.cut.unpaired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/23_4A_control_S17_L008_R2_001.cut.paired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/23_4A_control_S17_L008_R2_001.cut.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


trimmomatic PE /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/31_4F_fox_S22_L008_R1_001.cut.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/31_4F_fox_S22_L008_R2_001.cut.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/31_4F_fox_S22_L008_R1_001.cut.paired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/31_4F_fox_S22_L008_R1_001.cut.unpaired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/31_4F_fox_S22_L008_R2_001.cut.paired.fastq.gz \
/projects/bgmp/skupp/bioinfo/Bi622/QAA/trimmomatic_out/31_4F_fox_S22_L008_R2_001.cut.unpaired.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35