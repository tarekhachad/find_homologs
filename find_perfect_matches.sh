#!/bin/bash

# Run BLAST and personalize format to include necessary information

blastn -query "$1" -subject "$2" -outfmt '6 qseqid sseqid pident qlen slen' -task blastn-short > temp_output.txt

# Use awk to filter for perfect matches only

awk '$3 == 100.00 && $4 == $5' temp_output.txt > $3

# Print number of perfect matches to stdout

cat "$3" | wc -l

# remove temp output file

rm temp_output.txt
