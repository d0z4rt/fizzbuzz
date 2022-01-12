#!/bin/bash
echo "Start num"
# read start
start=$1

echo "Stop num"
# read stop
stop=$2

file=results/results-$(date +%s).log

while [ $start -le $stop ]
do
    # Check if divide by 3 & 5
    if [[ 0 -eq "($start%3) + ($start%5)" ]] 
    then
        echo "fizz buzz"
        echo "fizz buzz" >> $file

    # Check if divide by 5   
    elif [[ 0 -eq "($start%5)" ]]
    then
        echo "buzz"
        echo "buzz" >> $file

    # Check if divide by 3
    elif [[ 0 -eq "($start%3)" ]]
    then
        echo "fizz"
        echo "fizz" >> $file

    else
        echo "$start"
        echo "$start" >> $file

    fi	
    start=$(( $start + 1 ))
done