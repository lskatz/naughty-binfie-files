# Naughty binfie files

A set of example files for bioinformatics applications.

There are good files and naughty files.
Naughty files should cause an error in a bioinformatics program.

# Installation

To save space, we have the "good" files under good
and no naughty files in the actual repo.

To create the naughty files, run

```bash
for i in t/*.sh; do bash $i; done;
```

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
