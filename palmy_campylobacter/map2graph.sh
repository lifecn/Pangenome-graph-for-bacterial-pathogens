#!/bin/bash
module load vg/1.41.0

data=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/palmy_campylobacter/NGS_data/*_1.fq.gz
input_folder=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/palmy_campylobacter/NGS_data
output=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/palmy_campylobacter/map2graph
index=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/palmy_campylobacter/4campy_graph_ref/4campy_1k95_256.gcsa
basename=/home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/palmy_campylobacter/4campy_graph_ref/4campy_1k95_256

for f in $data
do
x=$(basename $f _1.fq.gz)
echo ${x}

read1=${x}_1.fq.gz
read2=$(echo $read1|sed 's/_1.fq.gz/_2.fq.gz/')

echo $read2
vg map -t 20  -d $basename -g $index  -f $input_folder/$read1 -f $input_folder/$read2 -N $x  > $output/${x}vgmap_4campy.gam
vg stats -a  $output/${x}vgmap_4campy.gam  >$output/${x}vgmap_4campy_stats

done 
