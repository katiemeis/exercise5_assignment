# usage: bash collab_wages.sh wages.csv
# this script takes the input of wages.csv
# separates into unique rows sorted first by gender and then by years experience for that gender
# output: wagesOutComplete.txt

for file in "$@"
do 
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "female" -w | sort -t , -k 2 -n > wagesOutFemale.txt
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "male" -w | sort -t , -k 2 -n > wagesOutMale.txt
	
	cat wagesOutFemale.txt wagesOutMale.txt | tr ',' ' ' > wagesOutComplete.txt
	
	

done


