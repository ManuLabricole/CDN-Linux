#!/bin/bash
BGreen='\033[1;32m'
BRed='\033[1;31m'
BCyan='\033[1;36m'
BIYellow='\033[1;93m'
NC='\033[0m'

#Iter 2
# Variable doit venir de main.sh

cd employees_WDGAS/WDGAS
dir=$(pwd)
depList=("BU HR IT")

echo -e "Current workind dir is -->${BCyan}$dir${NC}<--" 
for depDir in BU HR IT; do
echo $depDir
    if [[ -d ./$depDir ]]
    then
        echo -e "The folder ${BGreen}-->${depDir}<--${NC} exist"
    
    else
        echo -e "The folder ${BRed}-->${depDir}<--${NC} doesn't exist"
        echo -e "Creating folder..."
	mkdir $depDir 
    fi
done

for fullfile in $(ls); do
basename=$(echo "$fullfile" | cut -d. -f1 > $fullfile )
a=
done
