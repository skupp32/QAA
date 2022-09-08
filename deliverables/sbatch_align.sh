#!/bin/bash
#SBATCH --partition=bgmp       ### Partition (like a queue in PBS)
#SBATCH --job-name=assemble_genome     ### Job Name
#SBATCH --output=assemble_genome.out     ### File in which to store job output
#SBATCH --error=assemble_genome.err        ### File in which to store job error
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp     ### Account used for job submission
#SBATCH --cpus-per-task=8       ###Number of cores

conda activate QAA

cd /projects/bgmp/skupp/bioinfo/Bi622/QAA

PE1=trimmomatic_out/23_4A_control_S17_L008_R1_001.cut.paired.fastq.gz 
PE2=trimmomatic_out/23_4A_control_S17_L008_R2_001.cut.paired.fastq.gz

STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn  $PE1 $PE2 \
--genomeDir Mus_musculus.GRCm39.107 \
--outFileNamePrefix 23_4A_control_S17_L008_aligned


PE1=trimmomatic_out/31_4F_fox_S22_L008_R1_001.cut.paired.fastq.gz 
PE2=trimmomatic_out/31_4F_fox_S22_L008_R2_001.cut.paired.fastq.gz

STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn  $PE1 $PE2 \
--genomeDir Mus_musculus.GRCm39.107 \
--outFileNamePrefix 31_4F_fox_S22_L008_aligned