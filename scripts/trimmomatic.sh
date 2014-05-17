#!/bin/bash

#Run trimmomatic with the parameters specified
ADAPTER_PATH=/storage1/home/s_alisa/Hydra/tools/Trimmomatic-0.32/adapters/
DATA=/storage1/home/s_alisa/Hydra/data/
ANALYSIS=/storage1/home/s_alisa/Hydra/analysis/trimmomatic/

trimmomatic-0.32.jar PE -threads 32 -phred64 -trimlog ${ANALYSIS%%/}/trimmomatic.log \
 ${DATA%%/}/SRR1032106_1.fastq ${DATA%%/}/SRR1032106_2.fastq ${ANALYSIS%%/}/SRR1032106_1p.fq ${ANALYSIS%%/}/SRR1032106_1u.fq ${ANALYSIS%%/}/SRR1032106_2p.fq ${ANALYSIS%%/}/SRR1032106_2u.fq \
 ILLUMINACLIP:TruSeq2-PE.fa:2:30:10 TRAILING:28 MINLEN:20 &
