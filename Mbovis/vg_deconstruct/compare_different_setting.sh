#!/bin/bash 

data=./*_aeK_path1.vcf


for f in  $data 

do 
x=$(basename $f _aeK_path1.vcf)
echo ${x}

grep -v '#' ${x}_aeK_path1.vcf |cut -f 1-5 >${x}_aekp1vcf_sites

done 

cat *_aekp1vcf_sites |sort -n -k 2,2 |uniq -c |sed s'/ /\t/g' |cut -f 7-12 >super_sites 



data2=./*_aekp1vcf_sites

for b in $data2

do 

y=$(basename $b _aekp1vcf_sites)
echo ${y}

perl cherk_variationSites_hash_graph.pl super_sites ${y}_aekp1vcf_sites |sed s'/ /\t/g' |cut -f 7  >super_sites_${y} 


done 
paste super_sites super_sites_3bovis_restart1_1k95 super_sites_3bovis_restart2_5k95 super_sites_3bovis_restart3_10k95  > super_sites_3settings


awk '{for(i=7;i<=NF;i++){NUM=NUM?NUM+$i:$i};$(NF+1)=NUM;NUM=""} 1' super_sites_3settings |sed s'/ /\t/g' >super_sites_3settings_1 
