#!/bin/bash
BGreen='\033[1;32m'
BRed='\033[1;31m'
BCyan='\033[1;36m'
BIYellow='\033[1;93m'
NC='\033[0m'

username=emmanuel
pswd=emmanuel20230307
server="51.158.73.46"

#Connect to server
ssh ${username}@${server}

write "test script"
wd=$(pwd)
write $wd
#echo "running $0"
#targetDir=$2
#file=$1
#if [[ -d "$targetDir" ]]
#then
#rm -r $targetDir
#echo -e "Removing existing $targetDir"
#fi
#echo -e "creating folder ${targetDir}"
#mkdir $targetDir
#unzip $file -d $targetDir
#echo -e "Successfully unzip -->${BCyan}${file}${NC}<-- in folder -->${BCyan}${targetDir}${NC} <--"
