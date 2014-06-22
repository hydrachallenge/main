#!/bin/bash
export BOWTIE2_INDEXES=/storage1/home/s_alisa/Hydra/data/curvibacter/index/

#Set variables
DATA=/storage1/home/s_alisa/Hydra/data/SRR1032106_cont/
ANALYSIS=/storage1/home/s_alisa/Hydra/analysis/bowtie2/curvibacter/

#Execute bowtie2
bowtie2 -t -p 32 -x curvibacter -1 ${DATA%%/}/SRR1032106_1p.fastq -2 ${DATA%%/}/SRR1032106_2p.fastq \
-U ${DATA%%/}/SRR1032106_1u.fastq -U ${DATA%%/}/SRR1032106_2u.fastq \
-S ${ANALYSIS%%/}/SRR1032106_cont.sam > ${ANALYSIS%%/}/bowtie2.log 2>&1
