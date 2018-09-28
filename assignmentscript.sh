#for task 1: sort wages.csv by gender and yearsExperience
cat wages.csv | cut -d ,1,2 | sed 's/,/ /g' | sort -k1,1d -k2,2n | uniq  > gender-yearsExperience.csv 

#for task 2:
