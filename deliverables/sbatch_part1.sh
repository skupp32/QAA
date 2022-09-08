#!/bin/bash
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=py_vs_fastqc%j     ### job name
#SBATCH --output=base_q_score.out    ### file in which to store job stdout
#SBATCH --error=base_q_score.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### number of nodes to request
#SBATCH -A bgmp                ### account

conda activate QAA
ml fastqc/0.11.5 


/usr/bin/time -v \
python demux_base_exp.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz -l 101
/usr/bin/time -v \
python demux_base_exp.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz -l 101
/usr/bin/time -v \
python demux_base_exp.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz -l 101
/usr/bin/time -v \
python demux_base_exp.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz -l 101



/usr/bin/time -v \
fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz \
-o /projects/bgmp/skupp/bioinfo/Bi622/QAA/fastqc_out
/usr/bin/time -v \
fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz \
-o /projects/bgmp/skupp/bioinfo/Bi622/QAA/fastqc_out
/usr/bin/time -v \
fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz \
-o /projects/bgmp/skupp/bioinfo/Bi622/QAA/fastqc_out
/usr/bin/time -v \
fastqc /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz \
-o /projects/bgmp/skupp/bioinfo/Bi622/QAA/fastqc_out



