#!/bin/bash

# =======================
#        CONFIG
# =======================

# Color code variables
purple="\e[1;35m"
blue="\e[0;34m"
red="\e[0;31m"
reset="\e[0m"

# File to write
directory=results
file=${directory}/results-$(date +%s).log

# Sequence config
# check if a variable is set: https://stackoverflow.com/a/13864829
# read start
if [ -z ${1+x} ]; then start=0; else start=$1; fi
# read stop
if [ -z ${2+x} ]; then stop=10; else stop=$2; fi

# =======================
#        HEADER
# =======================

echo -e "
${purple}888888 88 8888P 8888P 8888Yb 88   88 8888P 8888P 
88__   88   dP    dP  88__dP 88   88   dP    dP  
88''   88  dP    dP   88''Yb Y8   8P  dP    dP   
88     88 d8888 d8888 88oodP 'YbodP' d8888 d8888${reset}

Start: $start | Stop: $stop
"

# =======================
#        SCRIPT
# =======================

# Check if the directory to write exists
[[ -d "$directory" ]] || mkdir "$directory"

# FizzBuzz loop
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