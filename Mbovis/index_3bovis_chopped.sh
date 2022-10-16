#!/usr/bin/bash

module load vg/1.41.0 


vg mod -t 32 -X 256 3bovis_restart3_10k95.gfa > 3bovis_restart3_10k95_chopped.vg
vg index -t 46 -x 3bovis_restart3_10k95_chopped.xg 3bovis_restart3_10k95_chopped.vg
vg prune -t 48 -k 45 3bovis_restart3_10k95_chopped.vg >3bovis_restart3_10k95_pruned.vg
vg index -t 48 -b /tmp -p -x 3bovis_restart3_10k95_pruned.xg -g 3bovis_restart3_10k95_pruned.gcsa 3bovis_restart3_10k95_pruned.vg


#vg index -b ./temp -t 48 -p -x NM_26_2_restart_2_256.xg -g NM_26_2_restart_2_256.gcsa -k 16 NM_26_2_restart_2_256.vg




