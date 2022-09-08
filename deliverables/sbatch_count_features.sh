#!/bin/bash
#SBATCH --partition=bgmp     ### queue to submit to
#SBATCH --job-name=count_features    ### job name
#SBATCH --output=count_features.out    ### file in which to store job stdout
#SBATCH --error=count_features.err     ### file in which to store job stderr
#SBATCH --nodes=1               ### number of nodes to request
#SBATCH -A bgmp                ### account


conda activate QAA 

/usr/bin/time -v python ps8.py -f /projects/bgmp/skupp/bioinfo/Bi622/QAA/23_4A_control_S17_L008_alignedAligned.out.sam

/usr/bin/time -v python ps8.py -f /projects/bgmp/skupp/bioinfo/Bi622/QAA/31_4F_fox_S22_L008_alignedAligned.out.sam 