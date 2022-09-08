#!/usr/bin/python
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to count the number of mapped and unmapped reads in a file.")
    parser.add_argument("-f", "--sam_file", help="Gives directory to sam file", type=str,required=True)
    return parser.parse_args()

args = get_args()

sam_file = args.sam_file

num_mapped =0
num_not_mapped = 0
num_reads = 0
with open(sam_file,'r') as fh:
    for line in fh:
        if line[0] != '@':
            num_reads += 1
            line  = line.split('\t')
            flag = int(line[1])


            if ((flag & 256)) != 256:
                if ((flag & 4)) == 4:
                    num_not_mapped += 1
                elif ((flag & 4)) != 4:
                    num_mapped += 1

print(f'Number of reads mapped: {num_mapped}\nNumber of reads not mapped: {num_not_mapped}')
print(num_reads)