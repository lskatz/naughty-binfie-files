#!/bin/bash

logmsg(){
  script=$(basename $0)
  echo "$script: $@" >&2
}

scriptDir=$(dirname $0)
cd $scriptDir/..

mkdir -pv naughty

# Make a set of alignment files
good_asm="good/phiX.fasta.gz";
good_aln="good/phiX.aln";

# initiate the file
zcat $good_asm > $good_aln;

# Make a second entry with a large gap
zcat $good_asm | perl -lane '
  if($. == 1){
    $_ = ">large_gap";
  }
  if($. == 5){
    s/\w/-/g;
  }
  print;
' >> $good_aln;

# Make a third entry with a few SNPs
zcat $good_asm | perl -lane '
  if($. == 1){
    $_ = ">SNPs";
  }
  # replace As with Ts on the 2nd line
  if($. == 2){
    s/A/T/ig;
  }
  # replace the A with G on the 3rd
  if($. == 3){
    s/A/G/ig;
  }
  print;
' >> $good_aln;


