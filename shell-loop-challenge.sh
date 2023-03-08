#!/usr/bin/env bash

# loops: for, while, until, select
# For bonus credit, update your script to allow the user to specify how high the table should go, defaulting to 10 like above.

# use the first argument as the number if it was given
number=$1
rangemin=$2
rangemax=$3

# until statement to see if an argument was provided
# if no argument was provided ask for one
# code to make sure it's really a whole number

# ← Need to skip all this if 3 values were supplied! → 
# use that if [[ -z $1 $2 $3 ]] type syntax

until echo "$number" | egrep -q '^[[:digit:]]+$'
	do
		read -p "Give me a whole number and I'll show you the times table for it " number
		# ask if user wants to define the range. If they answer anything but yes, it will use the default of 1-10
		read -p "Do you want to define the range for the times table? Type yes or no " yesno
		if [[ $yesno == 'yes' ]]
			then
				# Keep asking till the user supplies a whole number for range min		
				until echo "$rangemin" | egrep -q '^[[:digit:]]+$'
					do
						# Ask user for range minimum and assign to variable rangemin
						read -p "Give me the minimum value by which you want to multiply: " rangemin		
					done
				# Keep asking till the user supplies a whole number for range max
				until echo "$rangemax" | egrep -q '^[[:digit:]]+$'
					do
						read -p "Now give me the max value by which you want to multiply: " rangemax 
					done
		else
			rangemin=1
			rangemax=10
		fi
	done
	
# THIS WORKS	
# 	until echo "$number" | egrep -q '^[[:digit:]]+$'
# 	do
# 		read -p "Give me a whole number and I'll show you the times table for it from 1-10 " number
# 		until echo "$rangemin" | egrep -q '^[[:digit:]]+$'
# 			do
# 				read -p "Define a range of values to multiply by - starting by the minimum: " rangemin		
# 			done
# 		until echo "$rangemax" | egrep -q '^[[:digit:]]+$'
# 			do
# 				read -p "Now give me the max number by which you want to multiply: " rangemax 
# 			done
# 		echo "minimum is $rangemin and maximum is $rangemax and initial number is $number"
# 	done

# use `bc` basic calculator to do the arithmetic

# Error check in case they put a bigger minimum than maximum
if [[ $rangemin -le $rangemax ]]
	then
		while  [[ $rangemin -le $rangemax ]]
			do 
				answer=`echo "$rangemin*$number" | bc`
				echo "$rangemin x $number = $answer"	
				((rangemin=rangemin+1))
			done
	else
		while  [[ $rangemin -gt $rangemax ]]
			do
				answer=`echo "$rangemin*$number" | bc`
				echo "$rangemin x $number = $answer"	
				((rangemin=rangemin-1))
			done
fi
			

		
	
