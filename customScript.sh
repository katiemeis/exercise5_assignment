# File must contain unique gener, years experience combinations
# Gender first column, years experience second column
# Space separating the two columns
# Sort rows first by gender
# Then sort rows by years experience

cat wages.csv | cut -d ',' -f 1-2 | tail -n +2 | sort -u
