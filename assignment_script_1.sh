#Usage: cat $file | bash assignment_script_1.sh
#Will write a new file with unique gender-yearsExperience relations

for i in *.csv
do
cat $i | tail -n +2 | cut -d , -f 1,2 | sed -E 's/\,/ /g' | sort -u -t " " -k1,1 -k2n,2 > output1.txt
done
