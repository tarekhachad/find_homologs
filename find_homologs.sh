#!/bin/bash

# Run BLAST and personalize format to include necessary information

tblastn -query "$1" -subject "$2" -outfmt '6 pident length qlen' -task blastn-short | awk '$3 == 100.00 && $4 == $5' > $3

# Print number of perfect matches to stdout

cat "$3" | wc -l

