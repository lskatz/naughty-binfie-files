#!/bin/bash

logmsg(){
  script=$(basename $0)
  echo "$script: $@" >&2
}

scriptDir=$(dirname $0)
cd $scriptDir/..

mkdir -pv naughty

good=good/phiX.fasta.gz

naughty="naughty/phiX.hexcodes.fasta"
logmsg "Making a fasta file with hex codes in the middle"
zcat $good | perl -lane '
  if($. == 11){
    $_ = "";
    for my $int(0..256 ** 2){
      my $hex = "\x$int";
      $_ .= pack("H*", $hex);
    }
  }
  print;
' > $naughty

