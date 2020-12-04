# Naughty binfie files

A set of example files for bioinformatics applications.

There are good files and naughty files.
Naughty files should cause an error in a bioinformatics program.
They fail a formal specification of the format.

Good files are properly formatted.
However, some programs might choose to fail on certain cases:
empty contents,
fasta with ragged line lengths in the sequence section,
fasta with unicode sequence ids,
CRLF fastas,
CR fastas,
fastas that have multiple sequences and dashes and therefore imply they might be an alignment, but the sequences aren't actually all the same length

For these nuanced cases where the format passes specification
but where individual programs might fail them, we cannot
call them naughty.
It is up to the individual programs to raise an error for
their own specific definitions of naughty and is ouside the
scope of this repo.

# Installation

To save space, we have the "good" files under good
and no naughty files in the actual repo.

To create the naughty files, run

```bash
for i in t/*.sh; do bash $i; done;
```

# Files

## Good files

* R1/R2 fastq files (max compression)
* phiX assembly `NC_001422.1`

## Bad files

* fastq.gz
  * R1/R2 with mismatched pairs
  * R1/R2 with R1 truncated
  * R1/R2 with R2 truncated
* fasta
  * phiX assembly with binary data in the middle of it

# Contributions

Create an issue first to discuss it,
and then when ready, make a pull request.

## Wanted

### Good files

* Good sam file
* Good fasta file
* Good multifasta file
* etc

### Bad files

Bad files are generated from good files when possible
with a bash script under `t/`.

* Bad sam file
* Bad fasta file
* bad multifasta file
* etc
