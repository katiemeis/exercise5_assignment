#Gives Gender,yearsExperience, and wage of highest earner
cat wages.csv | sort -n -k4,4 | sed -E 's/\,/\ /g' | head -n 1 | cut -d " " -f 1,2,4 >output2.txt
 
#Gives Gender, yearsExperience, and wage of lowest earner
cat wages.csv | sort -n -k4,4 | sed -E 's/\,/\ /g' | tail -n 1 | cut -d " " -f 1,2,4 >output3.txt

#Gives number of females in top ten earners in data set 
cat wages.csv | sort -n -k4,4 | sed -E 's/\,/\ /g' | head -n 10 | grep "female" | wc -l  >output4.txt
