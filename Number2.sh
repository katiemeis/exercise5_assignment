#usage: first part tells you highest earner in wages.csv
#usage: second part tells you lowest earner in wages.csv
#usage: third part tells you how many females are in the top 10 earners

echo "Highest Earner:"
sort wages.csv -t , -n -k 4,4 | tail -n 1
echo "Lowest Earner:"
sort wages.csv -t , -n -k 4,4 | head -n 2 | tail -n 1
echo "Number of females in the Top 10 Earners"
sort wages.csv -t , -n -k 4,4 | tail -n 10 | grep female | wc -l
