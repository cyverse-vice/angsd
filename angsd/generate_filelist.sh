#!/bin/bash

for i in `ls *.bam`;do samtools index $i;done

#echo "indexed bamfiles"

for i in "$(pwd)"/*.bam; do echo "${i}"; done > bam.filelist

echo "created bam.filelist"

/angsd/angsd $@ -b bam.filelist

echo "ran angsd"
