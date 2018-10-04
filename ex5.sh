#!/bin/bash
cat wages.csv | tr "," " " | cut -d " " -f1,2 | sort -t " " -u -k1,1 -k2,2n > genderandexp.txt
cat wages.csv | cut -d, -f1,2,4 | sort -t "," -k3n | tail -1;echo "highest earner"
cat wages.csv | cut -d, -f1,2,4 | sort -t "," -k3n | head -2;echo "lowest earner"
cat wages.csv | sort -t "," -k4n | tail -10 | grep "female" | wc -l;echo "female top earners"
min16=$( cat wages.csv | grep -E "[a-z]+,16,"| sort -t"," -k4n | head -1 | cut -d, -f4 )
min12=$( cat wages.csv | grep -E "[a-z]+,12,"| sort -t"," -k4n | head -1 | cut -d, -f4 )
echo "$min12 - $min16" | bc; echo "min difference"
