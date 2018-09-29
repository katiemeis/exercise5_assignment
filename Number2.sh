#usage: first part tells you highest earner in wages.csv
#usage: second part tells you lowest earner in wages.csv
#usage: third part tells you how many females are in the top 10 earners

cat wages.csv | tail -n +2 |cut -d "," -f 1,2 | sort -t "," -k1,1 -k2,2n | tr "," " " | uniq > gendersYears.txt

echo "Highest Earner:"
sort wages.csv -t , -n -k 4,4 | tail -n 1
echo "Lowest Earner:"
sort wages.csv -t , -n -k 4,4 | head -n 2 | tail -n 1
echo "Number of females in the Top 10 Earners"
sort wages.csv -t , -n -k 4,4 | tail -n 10 | grep female | wc -l

val1=$(sort wages.csv -t "," -n -k3,3n | cut -d , -f 3,4 | grep 16, | sort -t "," -k2,2n  | head -n 1 | cut -d , -f 2)
val2=$(sort wages.csv -t "," -n -k3,3n | cut -d , -f 3,4 | grep 12, | sort -t "," -k2,2n  | head -n 1 | cut -d , -f 2)
#echo "$val1"
#echo "$val2"
echo "The wage difference for college grads is an income boost of: "
echo "$val1-$val2" | bc
