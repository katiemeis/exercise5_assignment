#!/bin/bash
#bash script.sch wages.csv 

cat $1 | cut -d , -f 1,2 | tr ',' ' ' | sort -t ' ' -k1,1 -k2,2 -n > $1_unique.csv

echo "highest earner"
cat $1 | grep -v 'gender' | sort -t , -k 4 -n |tail -n 1 

echo "lowest earner"
cat $1 | grep -v 'gender' | sort -t , -k 4 -n | head -n 1

echo "top ten female earners"
cat $1 | grep -w 'female' | sort -t , -k 4 -n | tail -n 10
