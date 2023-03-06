fr
#!/bin/sh
BGreen='\033[1;32m'
BRed='\033[1;31m'
BCyan='\033[1;36m'
NC='\033[0m'

echo script running


echo enter the language name:
read lang
file="${lang}.txt"
rawFile="raw_${lang}_info.txt"
writeFile="preproc_${lang}.txt"
echo -e "treating file --> ${BCyan}${file}${NC} <--"
touch "$rawFile"
echo > "$rawFile"

date >> "$rawFile"
echo substitute punctuation...
echo "Data before punctuation :\n" >> $rawFile

nbLines=$(wc --lines $file)
printf "Nb Lines : $nbLines\n" >> $rawFile

nbWords=$(wc --words $file)
printf "Nb Words : $nbWords\n" >> $rawFile

nbBytes=$(wc --bytes $file)
printf "Nb Bytes : $nbBytes\n" >> $rawFile

echo -e "Call cleanFile.sh"
bash cleanFile.sh $file
