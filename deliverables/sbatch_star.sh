#!/bin/bash
#SBATCH --partition=bgmp       ### Partition (like a queue in PBS)
#SBATCH --job-name=build_database    ### Job Name
#SBATCH --output=build_db.out         ### File in which to store job output
#SBATCH --error=build_db.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp     ### Account used for job submission
#SBATCH --cpus-per-task=8       ###Number of cores

conda activate QAA


cd /projects/bgmp/skupp/bioinfo/Bi622/QAA

STAR --runThreadN 8 --runMode genomeGenerate \
--genomeDir  "Mus_musculus.GRCm39.107" \
--genomeFastaFiles   Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile Mus_musculus.GRCm39.107.gtf