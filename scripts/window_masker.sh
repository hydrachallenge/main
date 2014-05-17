#!/bin/bash
echo 'Executing windowmasker with parameters specified'
windowmasker -mk_counts -checkdup true -fa_list false \
-in /storage1/home/s_alisa/Hydra/data/Hydra_RP/hma_ref_Hydra_RP_1.0_chrUn.fa \
-mem 4096 \
-out /storage1/home/s_alisa/Hydra/analysis/window_masker/hma_ref_Hydra_RP_1.0_chrUn.counts
