#Usage: cat $file | bash assignment_script_1.sh
#Will do a thing

for i in *.csv
do
cat $i | cut -d , -f 1,2 | sed -E 's/\,/ /g' | sort -t " " -k1,1 -k2n,2 > output1.txt
done
