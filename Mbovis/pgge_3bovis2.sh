#!/bin/bash

module load pgge/20210412
inputGFA=./pgge/*.gfa
input_folder=./pgge
inputfa=./3bovis_restart.fa
output=./pgge

for x in $inputGFA
do 
pgge -g $x -f $inputfa -o $output -r /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/pgge/scripts/beehave.R -b $output/pgge_3bovis_peanut_bed -l 100000 -s 5000 -t 16

done