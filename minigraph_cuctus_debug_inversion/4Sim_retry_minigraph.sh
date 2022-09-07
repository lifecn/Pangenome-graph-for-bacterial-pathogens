#!/bin/bash

module load cactus/2.1.1

cd /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/Minigraph-Cactus/4Sim

#construct Minigraph GFA
cactus-minigraph ./jobstore ./4Sim_retry.txt ./4Sim_retry.gfa.gz --realTimeLogging --mapCores 24 --reference NC_017518

#Mapping the Genomes Back to the Minigraph
cactus-graphmap ./jobstore ./4Sim_retry.txt ./4Sim_retry.gfa.gz 4Sim_retry.paf --realTimeLogging --mapCores 16 --reference NC_017518 --outputFasta 4Sim_retry.gfa.fa.gz

#creatCactusAlignment

cactus-align ./jobstore ./4Sim_retry.txt ./4Sim_retry.paf ./4Sim_retry.hal --pangenome --pafInput --outVG --reference NC_017518 --realTimeLogging

#vg_index
cactus-graphmap-join ./jobstore --vg ./4Sim_retry.vg --outDir ./4Sim_retry.pg --outName 4Sim_retry.pg-2 --reference NC_017518 --vcf --giraffe --gfaffix  --wlineSep "." --realTimeLogging
