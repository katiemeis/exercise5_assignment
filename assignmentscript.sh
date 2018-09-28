#for task 1: sort wages.csv by gender and yearsExperience
cat wages.csv | cut -d ,1,2 | sed 's/,/ /g' | sort -k1,1d -k2,2n | uniq  > gender-yearsExperience.csv 

#for task 2:
cat wages.csv | cut -d , -f 1,2,4 | sed 's/,/ /g' | sort -k3 | head -n 1 tail -n 1

#incomplete part of task 2: will give top 10 earners and count number of lines with female
head -n 10 | grep -n "female"
