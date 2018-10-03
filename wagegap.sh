#can separate out different aspects and sort the csv
#gender,yearsExperience,yearsSchool,wage
#usage: bash wagegap.sh file

for gender in $1
do 
cat $1 | cut -d , -f 1,2 | sort -d , -f 1 -f 2 | tr (,) ( ) > gye.txt
done
