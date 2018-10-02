# Problem One
cat wages.csv | cut -d ',' -f 1-2 | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k1,1 -k2,2n > genderyearsExperience.txt

# Problem Two
# Save information about the highest earner as $highestEarner
highestEarner=$(cat wages.csv | cut -d ',' -f 1,2,4 | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k3 -n | tail -1)

# Obtain the highest earner's gender
highestEarnerGender=$(echo $highestEarner | cut -d ' ' -f 1)

# Obtain the highest earner's years experience
highestEarnerYears=$(echo $highestEarner | cut -d ' ' -f 2)

# Obtain the highest earner's wage
highestEarnerSalary=$(echo $highestEarner | cut -d ' ' -f 3)

# Output the results
echo The highest earner is $highestEarnerGender and has $highestEarnerYears of experience and earns $highestEarnerSalary\$ per hour

# Repeat the above for the lowest earner
lowestEarner=$(cat wages.csv | cut -d ',' -f 1,2,4 | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k3 -n | head -1)
lowestEarnerGender=$(echo $lowestEarner | cut -d ' ' -f 1)
lowestEarnerYears=$(echo $lowestEarner | cut -d ' ' -f 2)
lowestEarnerSalary=$(echo $lowestEarner | cut -d ' ' -f 3)

echo The lowest earner is $lowestEarnerGender and has $lowestEarnerYears of experience and earns $lowestEarnerSalary\$ per hour

# Females in the top ten
topFemales=$(cat wages.csv | cut -d ',' -f 1,2,4 | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k3,3n | tail -10 | grep female -c)

echo There are $topFemales females in the top ten earners

# Problem Three
collegeAverage=$(cat wages.csv | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k4,4n -k3,3n | awk '{if (($3 == 12) || ($3 == 16)) { print } }' | sort -k3,3n | tail -16 | awk '{ total += $4 } END { print total/NR }')

echo The average wage of college graduates is $collegeAverage\$ per hour

highschoolAverage=$(cat wages.csv | tail -n +2 | sort -u | sed 's/,/ /g' | sort -k4,4n -k3,3n | awk '{if ($3 == 12) { print } }' | awk '{ total += $4 } END { print total/NR}')

echo the average wage of high school graduates is $highschoolAverage\$ per hour

differenceWage="$(echo "$collegeAverage - $highschoolAverage" | bc)"

echo College graduates earn $differenceWage\$ more than high school graduates per hour
