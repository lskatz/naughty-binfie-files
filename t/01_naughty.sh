#!/bin/bash

logmsg(){
  script=$(basename $0)
  echo "$script: $@" >&2
}

scriptDir=$(dirname $0)
cd $scriptDir/..

mkdir -pv naughty

# Make a mismatched R1/R2 set of fastq files
R1=naughty/mismatched_R1_S1_L001_001.fastq.gz
R2=naughty/mismatched_R2_S1_L001_001.fastq.gz
logmsg "Making mismatched R1/R2"
logmsg "                    => $R1"
zcat good/R1.fastq.gz | paste - - - - | shuf --random-source=<(yes 42) | \
  tr '\t' '\n' | gzip -c > $R1
logmsg "                    => $R2"
zcat good/R2.fastq.gz | paste - - - - | shuf --random-source=<(yes 43) | \
  tr '\t' '\n' | gzip -c > $R2

# Truncated R1
R1=naughty/truncatedR1_R1_S1_L001_001.fastq.gz
R2=naughty/truncatedR1_R2_S1_L001_001.fastq.gz
logmsg "Making truncated R1 file"
logmsg "                   => $R1"
zcat good/R1.fastq.gz | head -n 443 | gzip -c > $R1
logmsg "                   => $R2"
ln good/R2.fastq.gz $R2

# Truncated R2
R1=naughty/truncatedR2_R1_S1_L001_001.fastq.gz
R2=naughty/truncatedR2_R2_S1_L001_001.fastq.gz
logmsg "Making truncated R2 file"
logmsg "                   => $R1"
ln good/R1.fastq.gz $R1
logmsg "                   => $R2"
zcat good/R2.fastq.gz | head -n 443 | gzip -c > $R2


