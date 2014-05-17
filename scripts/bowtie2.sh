#!/bin/bash
export BOWTIE2_INDEXES=/storage1/home/s_alisa/Hydra/analysis/Hydra_index

#Set variables
DATA=/storage1/home/s_alisa/Hydra/data/
ANALYSIS=/storage1/home/s_alisa/Hydra/analysis/bowtie2/

#Execute bowtie2
bowtie2 -t -p 32 -x Hydra_index -1 ${DATA%%/}/SRR1033637_1.fastq -2 ${DATA%%/}/SRR1033637_2.fastq -S ${ANALYSIS%%/}/SRR1033637.sam > ${ANALYSIS%%/}/bowtie2.log 2>&1
