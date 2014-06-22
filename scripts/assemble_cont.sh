#!/bin/bash
#Try to assemble high GC reads from SRR1032106
DATA=/storage1/home/s_alisa/Hydra/data/SRR1032106_cont
spades.py --pe1-1 ${DATA%%/}/SRR1032106_1p.fastq --pe1-2 ${DATA%%/}/SRR1032106_2p.fastq \
--pe1-s ${DATA%%/}/SRR1032106_1u.fastq --pe2-s ${DATA%%/}/SRR1032106_2u.fastq \
-o /storage1/home/s_alisa/Hydra/analysis/spades/
