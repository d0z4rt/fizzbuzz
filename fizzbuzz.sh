#!/bin/bash

# Color code variables
purple="\e[1;35m"
blue="\e[0;34m"
red="\e[0;31m"
reset="\e[0m"

# File to write
directory=results
file=${directory}/results-$(date +%s).log

# Sequence config
# read start
start=$1
# read stop
stop=$2

echo -e "
${purple}888888 88 8888P 8888P 8888Yb 88   88 8888P 8888P 
88__   88   dP    dP  88__dP 88   88   dP    dP  
88''   88  dP    dP   88''Yb Y8   8P  dP    dP   
88     88 d8888 d8888 88oodP 'YbodP' d8888 d8888${reset}

Start: $1 | Stop: $2
"


[[ -d "$directory" ]] || mkdir "$directory"

while [ $start -le $stop ]
do
    # Check if divide by 3 & 5
    if [[ 0 -eq "($start%3) + ($start%5)" ]] 
    then
        echo -e "${purple}fizz buzz${reset}"
        echo "fizz buzz" >> $file

    # Check if divide by 5   
    elif [[ 0 -eq "($start%5)" ]]
    then
        echo -e "${red}buzz${reset}"
        echo "buzz" >> $file

    # Check if divide by 3
    elif [[ 0 -eq "($start%3)" ]]
    then
        echo -e "${blue}fizz${reset}"
        echo "fizz" >> $file

    else
        echo "$start"
        echo "$start" >> $file

    fi	
    start=$(( $start + 1 ))
done