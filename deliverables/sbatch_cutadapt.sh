#!/bin/bash
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=cutadapt%j    ### job name
#SBATCH --output=cutadapt.out    ### file in which to store job stdout
#SBATCH --error=cutadapt.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### number of nodes to request
#SBATCH -A bgmp                ### account
#SBATCH --cpus-per-task=10      ### number of cores/CPUs

conda activate QAA

/usr/bin/time  -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/31_4F_fox_S22_L008_R1_001.cut.fastq.gz \
-p /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/31_4F_fox_S22_L008_R2_001.cut.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz  --cores 10

/usr/bin/time  -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/23_4A_control_S17_L008_R1_001.cut.fastq.gz  -p /projects/bgmp/skupp/bioinfo/Bi622/QAA/cutadapt_out/23_4A_control_S17_L008_R2_001.cut.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz --cores 10
