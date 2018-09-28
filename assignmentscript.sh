cat wages.csv | cut -d ,1,2 | sed 's/,/ /g' | sort -k1,1d -k2,2n | less -S
