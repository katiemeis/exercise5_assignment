# part 2 of the assignment
#usage: bash wagegap2.sh wages.csv


echo "highest earner"
grep -v "gender" $1 |sort -t , -r -k 4,4n | head -n 1
echo "lowest earner"
grep -v "gender" $1 | sort -t , -k 4,4n | head -n 1
echo "top 10 females"
grep -v "gender" $1 | sort -t , -k 1,1 -k 4,4n | head -n 10
