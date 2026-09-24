#!/bin/bash
set -euo pipefail


curl "https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz"  > lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz      

# awk can remove blank / whitespace-only lines
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned.tsv

# tr can squeeze repeated newlines
cat lab3_data.tsv | tr -s '\n' > cleaned.tsv

tr '\t' ',' < cleaned.tsv > myfile.csv

OCCURRENCES=$(wc -l < myfile.csv) 

echo "$OCCURRENCES"

tar -czf converted-archive.tar.gz myfile.csv
