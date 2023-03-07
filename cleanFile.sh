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

cleanFile="preproc_${file}"
touch $cleanFile
echo > $cleanFile
echo -e "${BIYellow}Removing punctuation...${NC}"
sed -e "s/[[:punct:]]//g" ${file}|grep -v "^$" > $cleanFile
echo -e "${BGreen}Punctuation removed${NC}"
echo -e "${BIYellow}Substition Majuscule --> Minuscule"
sed -i "s/./\L&/g" $cleanFile
echo -e "${BGreen}Majuscule removed${NC}"
sed -i "s/[0-9]*//g" $cleanFile
echo -e "${BGreen}Number removed ${NC}"
echo -e "${BIYellow}Substition Space --> break${NC}"
sed -i "s/ /\n/g" $cleanFile
echo -e "${BGreen}Spaces replaced with LineBreaks${NC}"




echo -e "${BIYellow}Cleaning  -->${BCyan} $file ${BCyan} ${BIYellow}<--${NC}"
echo bash sortFile.sh $cleanFile

