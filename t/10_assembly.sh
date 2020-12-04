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
logmsg "   => $naughty"
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

naughty="naughty/phiX.pipes.fasta"
logmsg "Simulating multiple contigs with pipes, a nonstandard fasta format found in BioNumerics"
logmsg "   => $naughty"
zcat $good | perl -lane '
  # add a pipe in the middle of line 5
  if($. == 5){
    # perl lets you change a single character with substr() on the left side
    substr($_,10,1) = "|";
  }

  # add a pipe at the end of line 20
  if($. == 20){
    substr($_,0,1) = "|";
  }

  # add a pipe at the beginning of line 40
  if($. == 40){
    substr($_,-1,1) = "|";
  }

  print;

' > $naughty

