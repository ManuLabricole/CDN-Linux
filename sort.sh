#!/bin/sh
BGreen='\033[1;32m'
BRed='\033[1;31m'
BCyan='\033[1;36m'
BIYellow='\033[1;93m'
NC='\033[0m'

chmod +x cleanFile.sh
if [ -z "$1" ]; then
  echo "No file specified."
  exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "File not found: $file"
  exit 1
fi
cleanFile=$file
sortedFile="sortedFile.txt" 
touch $sortedFile
echo > $sortedFile
sort $cleanFile|uniq -c|sort -nr > $sortedFile



