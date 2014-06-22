#!/bin/bash
echo "Createing snpEff database for reference sequence and GFF file specified"
echo "Place GFF file with gene annotations to: /storage1/home/s_alisa/Hydra/tools/snpEff/data/hydra_rp_1.0/genes.gff"

SNPEFF=/storage1/home/s_alisa/Hydra/tools/snpEff/

java -Xmx4g -jar ${SNPEFF%%/}/snpEff.jar build -gff3 -v hydra_rp_1.0 > ${SNPEFF%%/}/snpEff_build.log
