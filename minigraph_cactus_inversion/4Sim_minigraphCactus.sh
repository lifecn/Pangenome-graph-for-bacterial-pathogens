#!/bin/bash

module load cactus/2.1.1

cd $path

#construct Minigraph GFA
cactus-minigraph ./jobstore ./4Sim_pg.txt ./4Sim.gfa.gz --realTimeLogging --mapCores 24 --reference NC_017518

#Mapping the Genomes Back to the Minigraph
cactus-graphmap ./jobstore ./4Sim_pg.txt ./4Sim.gfa.gz 4Sim.paf --realTimeLogging --mapCores 16 --reference NC_017518 --outputFasta 4Sim.gfa.fa.gz

#creatCactusAlignment

cactus-align ./jobstore ./4Sim_pg.txt ./4Sim.paf ./4Sim.hal --pangenome --pafInput --outVG --reference NC_017518 --realTimeLogging

#vg_index
cactus-graphmap-join ./jobstore --vg ./4Sim.vg --outDir ./4Sim.pg --outName 4Sim.pg-2 --reference NC_017518 --vcf --giraffe --gfaffix  --wlineSep "." --realTimeLogging
