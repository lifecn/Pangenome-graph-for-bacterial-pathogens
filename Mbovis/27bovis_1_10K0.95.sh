#!/bin/bash

module load pggb/0.4.0

input=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/Mycoplasma_bovis

pggb -i $input/27bovies.fa -s 10000 -p 95 -n 27 -t 16 -S -m -o 27bovis_1_10K0.95
