cat wages.csv | tail -n +2 |cut -d "," -f 1,2 | sort | sort -n -k2 | tr "," " " | uniq > dumbtest.txt
