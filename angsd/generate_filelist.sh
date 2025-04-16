#!/bin/bash
pwd
ls -l
file /angsd/bams/smallNA06985.mapped.ILLUMINA.bwa.CEU.low_coverage.20111114.bam
set -x

echo "listed info"

for i in `ls *.bam`;do samtools index $i;done

#echo "indexed bamfiles"

for i in `ls *.bam`; do echo "${i}"; done > bam.filelist

echo "created bam.filelist"

/angsd/angsd $@ -b bam.filelist

echo "ran angsd"
