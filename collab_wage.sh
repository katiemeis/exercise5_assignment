# usage: bash collab_wage.sh wages.csv
# this script serves as the main shell script for the completion of the 3 parts of exercise 5 assignment
# this script takes the input of wages.csv
#
# Part 1)
# separates into unique rows sorted first by gender and then by years experience for that gender
# output: wagesOutComplete.txt
# 
# Part 2) 
# returns the gender, years of experience, and wage for the highest earner
# returns the gender, years of experience, and wage for the lowest earner
# returns the number of females in the top 10 highest earners
# output: the aforementioned are printed in that order, and the output also specifies which is which
#
# Part 3)
# return an additional piece of information to the stdout of part 2
# takes the minimum/LOWEST wage for people with 12 years of education
# takes the minimum/LOWEST wage for people who have graduated college (16 years of education or more)
# takes the difference between the Lowest wages between college grads high school grads with no college experience
# output: adding onto stdout from part 2

for file in "$@"
do 
	# Part 1
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "female" -w | sort -t , -k 2 -n > wagesOutFemale.txt
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "male" -w | sort -t , -k 2 -n > wagesOutMale.txt
	
	cat wagesOutFemale.txt wagesOutMale.txt | tr ',' ' ' > wagesOutComplete.txt
	
	# Part 2 (yet to be completed)
	printf "The gender, years of experience, and wage for the highest earner is: "
	cat $file | sort -t , -k 4 | tail -n 2 | head -n 1 | cut -d , -f 1,2,4
	printf "The gender, years of experience, and wage for the lowest earner is: "
	cat $file | sort -t , -k 4 | head -n 2 | tail -n 1 | cut -d , -f 1,2,4
	printf "The number of females in the top 10 highest earners is: "
	cat $file | sort -t , -k 4 | tail -n 11 | head -n 10 | cut -d , -f 1,2,4 | grep "female" -w -c

	# Part 3
	wage1=$(cat $file | cut -d , -f 3,4 | sort -t , -k 1 -n | grep -E ^"12" -w | cut -d , -f 2 | head -n 1)
	wage2=$(cat $file | cut -d , -f 3,4 | sort -t , -k 1 -n | grep -E ^"16" -w | cut -d , -f 2 | head -n 1)
	printf "The difference between lowest wage for college graduates and non-college graduates is: "
	echo "$wage2 - $wage1" | bc
	# outputs to stdout

done