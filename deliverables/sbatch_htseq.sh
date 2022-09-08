#!/bin/bash
#SBATCH --partition=bgmp       ### Partition (like a queue in PBS)
#SBATCH --job-name=ht_seq   ### Job Name
#SBATCH --output=ht_seq.out         ### File in which to store job output
#SBATCH --error=ht_seq.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp     ### Account used for job submission
#SBATCH --cpus-per-task=12       ###Number of cores

conda activate QAA

cd /projects/bgmp/skupp/bioinfo/Bi622/QAA


htseq-count -f sam -r name --stranded=yes  --nprocesses 12 \
 -c 23_4A_control_S17_L008.stranded.count.tsv \
23_4A_control_S17_L008_alignedAligned.out.sort.sam Mus_musculus.GRCm39.107.gtf

htseq-count -f sam -r name --stranded=reverse  --nprocesses 12   \
-c 23_4A_control_S17_L008.reverse.count.tsv \
23_4A_control_S17_L008_alignedAligned.out.sort.sam Mus_musculus.GRCm39.107.gtf

htseq-count -f sam -r name --stranded=yes  --nprocesses 12 \
-c 31_4F_fox_S22_L008.stranded.count.tsv \
31_4F_fox_S22_L008_alignedAligned.out.sort.sam Mus_musculus.GRCm39.107.gtf

htseq-count -f sam -r name --stranded=reverse  --nprocesses 12 \
-c 31_4F_fox_S22_L008.reverse.count.tsv \
31_4F_fox_S22_L008_alignedAligned.out.sort.sam Mus_musculus.GRCm39.107.gtf


