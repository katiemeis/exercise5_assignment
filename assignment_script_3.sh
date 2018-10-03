#Function: Compares lowest wage earners between college and high school educated
#Usage: bash assignment_script_3.sh

HS_wage=$(cat wages.csv | cut -d "," -f 1,3,4 | sed -E 's/\,/ /g' | grep " 12 " | sort -n -k3,3 | head -n 1 | cut -d " " -f 3)
C_wage=$(cat wages.csv | cut -d "," -f 1,3,4 | sed -E 's/\,/ /g' | grep " 16 " | sort -n -k3,3 | head -n 1 | cut -d " " -f 3)

echo "$C_wage - $HS_wage" | bc 
