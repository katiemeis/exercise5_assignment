# usage: bash collab_wages.sh wages.csv
# this script serves as the main shell script for the completion of the 3 parts of exercise 5 assignment
# this script takes the input of wages.csv
#
# Part 1)
# separates into unique rows sorted first by gender and then by years experience for that gender
# output: wagesOutComplete.txt
# 
# Part 2) 
# To be integrated by Zach
#
# Part 3)
# return an additional piece of information to the stdout of part 2
# takes the average wage for people with 12 years of education
# takes the average wage for people who have graduated college (16 years of education or more)
# takes the difference between the average wages between college grads high school grads with no college experience

for file in "$@"
do 
	# Part 1
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "female" -w | sort -t , -k 2 -n > wagesOutFemale.txt
	cat $file | cut -d , -f 1,2 | sort -u | sort -t , -k 1 | grep "male" -w | sort -t , -k 2 -n > wagesOutMale.txt
	
	cat wagesOutFemale.txt wagesOutMale.txt | tr ',' ' ' > wagesOutComplete.txt
	
	# Part 2 (yet to be completed)

	# Part 3
	cat $file | cut -d , -f 3,4 | sort -t , -k 1 -n | grep -E ^"12" -w | cut -d , -f 2

done


