#!/usr/bin/env bash

# loops: for, while, until, select
# For bonus credit, update your script to allow the user to specify how high the table should go, defaulting to 10 like above.

# use the first argument as the number if it was given
number=$1
rangemin=$2
rangemax=$3

# Define a regular expression for a whole number to check each value against
regex="^[0-9]+$"

# if [[ -z $number ]]
# 	then
# 		echo "no number supplied"
# fi

# until statement to see if an argument was provided
# if no argument was provided ask for one
# code to make sure it's really a whole number

# ← Need to skip all this if 3 values were supplied! → 
# use that if [[ -z $1 $2 $3 ]] type syntax
# Want to say if $1 is blank then do everything below. If $1 exists, check to see if $2 and $3 exist
# what if $1 exists and $2 exists but no $3? I guess I could let them count down or up to 10?

if [[ -z $number ]]
	then
		echo "no number supplied"
		# Ask user for the number to multiply and optionally to define the range
		# until echo "$number" | egrep -q '^[[:digit:]]+$'
# 		until echo "$number" | egrep -q $regex	
		until [[ $number =~ $regex ]]			
			do
				read -p "Give me a whole number and I'll show you the times table for it: " number
					# ask if user wants to define the range. If they answer anything but yes, it will use the default of 1-10
					read -p "Do you want to define the range for the times table? Type yes or no " yesno
					if [[ $yesno == 'yes' ]]
						then
							# Keep asking till the user supplies a whole number for range min		
							until echo "$rangemin" | egrep -q $regex
								do
									# Ask user for range minimum and assign to variable rangemin
									read -p "Give me the minimum value by which you want to multiply: " rangemin		
								done
							# Keep asking till the user supplies a whole number for range max
							until echo "$rangemax" | egrep -q $regex
								do
									read -p "Now give me the max value by which you want to multiply: " rangemax 
								done
					else
						rangemin=1
						rangemax=10
					fi
				done
	else
		number=$1
		if [[ -z $2 ]] # if there iss no second argument, there cannot be a third so do not worry about it
			then # set range min/max to defaults
				rangemin=1
				rangemax=10
			else # assume there is a second and third argument and use them
				# if there iss no third argument, it multiplies down to zero. That sure iss convenient!
				rangemin=$2
				rangemax=$3
		fi
fi

# Check to see if they put in a bigger min than max, and count down instead if so
if [[ $rangemin -le $rangemax ]]
	then
			while  [[ $rangemin -le $rangemax ]]
			do 
			# use `bc` basic calculator to do the arithmetic
				answer=`echo "$rangemin*$number" | bc`
				echo "$rangemin x $number = $answer"	
				((rangemin=rangemin+1))
			done
	else
		while  [[ $rangemin -ge $rangemax ]]
			do
				# use `bc` basic calculator to do the arithmetic
				answer=`echo "$rangemin*$number" | bc`
				echo "$rangemin x $number = $answer"	
				# decrement rangemin to count down
				((rangemin=rangemin-1))
			done
fi
			

		
	
