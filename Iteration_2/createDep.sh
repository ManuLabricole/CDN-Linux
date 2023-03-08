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
 	echo -e $pwd
	rm -rf ./$depDir/*
    else
        echo -e "The folder ${BRed}-->${depDir}<--${NC} doesn't exist"
        echo -e "Creating folder..."
	mkdir $depDir 
    fi
done

for fullfile in $(ls); do
#First cleaning and check of part
basename=$(echo "$fullfile" | cut -d. -f1 | sed 's/[0-9]*//g' | tr '-' '_' )
echo -e "$basename"

part1=$(echo "$basename" | cut -d "_" -f 1)
part2=$(echo "$basename" | cut -d "_" -f 2)
part3=$(echo "$basename" | cut -d "_" -f 3)
#echo -e "$part1 $part2 $part3"
# Check if part 1 is equal to BU, HR, or IT, or if part 3 is equal to BU, HR, or IT
if [[ "$part1" == BU || "$part1" == HR || "$part1" == IT ]]
then
dep=$part1
name="${part3}_${part2}"
cp $fullfile ./$dep/$name.data
echo -e "Working in -->${BIYellow}${dep}${NC}<--"
echo -e "${BCyan}$name${NC}"

elif [[ "$part3" == BU || "$part3" == HR || $part3 == IT ]]
then
dep=$part3
name=${part2}_${part1}
echo -e "Working in -->${BIYellow}${dep}${NC}<--"
echo -e "${BRed}$name${NC}"
cp $fullfile ./$dep/$name.data
fi
done
