#!/bin/bash

# Divij Bhaw
# 23183845@student.uwa.edu.au
# Assignment 1 2022 class CITS2003


cat $fileName/*.txt > temp.txt

uniqWordsCount=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | wc -l )

if [[ -d "$1" ]]

then 

FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | head -n2 | tail -1 | rev | cut -d ' ' -f1 | rev )
foundInfiles=$(grep -rl "$FindWord" "$fileName" | wc -l)

echo "The 1st most common word is {"$FindWord"} across "$foundInfiles" files"


if [ "$1" == "-nth" ] &&  (("$2" >= "1" && "$2" <= "$uniqWordsCount"))

then

number=$(($2+1))

FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | head -n "$number"| tail -1 | rev | cut -d ' ' -f1 | rev )
foundInfiles=$(grep -rl "$FindWord" "$fileName" | wc -l)

echo "The "$2"th most common word is {"$FindWord"} across "$foundInfiles" files"



if [ "$1" == "-w" ] 

then 

filesList=$(grep -rl "$2" "$3")

findRank=$(for FILE in "$3" ;

    do
        tt=$(tr -c '[:alnum:]' '[\n*]' < $FILE | sort | uniq -c | sort -nr | grep -o -n "$2" | head -n1)
        echo "$tt" "$FILE"
    done
)

findHighestRank=$( echo "$findRank" | sort -nr | tail -n1 | cut -d: -f1)
findHighestRank=$(($findHighestRank-1))
findHighestRankedFile=$( echo "$findRank" | sort -nr | tail -n1 | cut -d " " -f2 | cut -d / -f2 )


echo "The most significant rank for the word "$2" is "$findHighestRank" in file "$findHighestRankedFile""


else 

echo bruh

fi
