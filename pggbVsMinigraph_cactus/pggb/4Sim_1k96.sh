#!/bin/bash

module load pggb/0.4.0

input=$path/4Sim.fa



pggb -i $input/4Sim.fa -s 1000 -p 96 -n 4 -t 48 -S -m -o 4Sim_pggb_1k96


