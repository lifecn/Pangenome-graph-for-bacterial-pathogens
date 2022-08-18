#!/bin/bash

module load cactus/2.1.1

cd /home/zyang/NGS/active/IPL/MENINGO/analysis/graph_genome/Minigraph-Cactus/4Sim

#construct Minigraph GFA
cactus-minigraph ./jobstore ./4Sim_retry2.txt ./4Sim_retry2.gfa.gz --realTimeLogging --mapCores 24 --reference NC_017518

#Mapping the Genomes Back to the Minigraph
cactus-graphmap ./jobstore ./4Sim_retry2.txt ./4Sim_retry2.gfa.gz 4Sim_retry2.paf --realTimeLogging --mapCores 16 --reference NC_017518 --outputFasta 4Sim_retry2.gfa.fa.gz

#creatCactusAlignment

cactus-align ./jobstore ./4Sim_retry2.txt ./4Sim_retry2.paf ./4Sim_retry2.hal --pangenome --pafInput --outVG --reference NC_017518 --realTimeLogging

#vg_index
cactus-graphmap-join ./jobstore --vg ./4Sim_retry2.vg --outDir ./4Sim_retry2.pg --outName 4Sim_retry2.pg-2 --reference NC_017518 --vcf --giraffe --gfaffix  --wlineSep "." --realTimeLogging
