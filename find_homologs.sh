#!/bin/bash

# Run BLAST and personalize format to include necessary information

tblastn -query "$1" -subject "$2" -outfmt '6 pident length qlen' -task tblastn | awk '$1 > 30.000 && $2 > $3' > $3

# Print number of perfect matches to stdout

cat "$3" | wc -l

