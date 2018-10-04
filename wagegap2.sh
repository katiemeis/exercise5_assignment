# part 2 of the assignment
#usage: bash wagegap2.sh wages.csv


echo "highest earner"
grep -v "gender" $1 |sort -t , -k 4,4nr | head -n 1
echo "lowest earner"
grep -v "gender" $1 | sort -t , -k 4,4n | head -n 1
echo "# of females in top 10"
grep -v "gender" $1 | sort -t , -k 4,4nr | head -n 10 | grep -w "female" | wc -l
