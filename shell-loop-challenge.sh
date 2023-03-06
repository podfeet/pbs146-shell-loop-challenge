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

until echo "$number" | egrep -q '^[[:digit:]]+$'
do
	read -p "Give me a whole number and I'll show you the times table for it: " number
done

# use `bc` basic calculator to do the arithmetic

for multiplier in {1..10}
do
	answer=`echo "$number*$multiplier" | bc`
	echo "$multiplier x $number = $answer"
done

