#!/bin/bash
REFERENCE=/storage1/home/s_alisa/Hydra/data/hma_ref_Hydra_RP_1.0_chrUn.fa.fai
DATA=/storage1/home/s_alisa/Hydra/data/
OUT=/storage1/home/s_alisa/Hydra/analysis/vcf/

samtools mpileup -6 -b ${DATA%%/}/SRR1033637.sam -f $REFERENCE > ${OUT%%/}/SRR1033637.vcf
