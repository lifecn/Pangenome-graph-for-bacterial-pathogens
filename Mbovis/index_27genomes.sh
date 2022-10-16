#!/usr/bin/bash

module load vg/1.41.0 


vg mod -t 32 -X 256 27bovies.10k95.gfa > 27bovies.10k95_chopped.vg
vg index -t 46 -x 27bovies.10k95_chopped.xg 27bovies.10k95_chopped.vg
vg prune -t 48 -k 45 27bovies.10k95_chopped.vg >27bovies.10k95_pruned.vg
vg index -t 48 -b /tmp -p -x 27bovies.10k95_pruned.xg -g 27bovies.10k95_pruned.gcsa 27bovies.10k95_pruned.vg


vg index -b ./temp -t 48 -p -x 27bovies.10k95_chopped.xg -g 27bovies.10k95_chopped.gcsa -k 16 27bovies.10k95_chopped.vg




