# effect of graduating college vs high school
# usage: bash collegeeffect.sh wages.csv

val1=$(cat $1 | grep -v "gender" | cut -d , -f 1,3,4 | sort -t , -k 3,3n | tr ',' ' ' | awk '$2 ~ /^16$/' | head -n 1 | tr ' ' ',' | cut -d , -f 3)

val2=$(cat $1 | grep -v "gender" | cut -d , -f 1,3,4 | sort -t , -k 3,3n | tr ',' ' ' | awk '$2 ~ /^12$/' | head -n 1 | tr ' ' ',' | cut -d , -f 3)

echo "$val1 - $val2" | bc

