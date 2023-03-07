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

echo -e "Receiving ${BCyan}-->${file}<---${NC} to be sorted"
part_after_underscore=$(echo "$file" | cut -d '_' -f2- | sed 's/\x1B\[[0-9;]\+[A-Za-z]//g')

echo -e "Extracting extension --> ${BGreen}${part_after_underscore}${NC} <--"

cleanFile=$file
sortedFile="sortedFile_${part_after_underscore}" 
echo -e "Creating new sorted file... -->${BCyan} ${sortedFile} ${NC}<--"
touch $sortedFile
echo -e > $sortedFile
sort $cleanFile|uniq -c|sort -nr > $sortedFile  
#sort $cleanFile|uniq -c|sort -nr > $sortedFile
echo -e "${CGreen}File sorted${NC}"
echo -e "Buidling First and Last 30 words files..."
top30=top_30_${part_after_underscore}
last30=last_30_${part_after_underscore}

touch $top30
echo > $top30
echo $date >> $top30
head -n 30 ${sortedFile} >> $top30 
touch $last30

