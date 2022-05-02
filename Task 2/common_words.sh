#!/bin/bash

# Divij Bhaw
# 23183845@student.uwa.edu.au
# Assignment 1 2022 class CITS2003


if [[ -d "$1" ]] ;

then
    cat $1/*.txt > all.txt
    
    FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | head -n2 | tail -1 | rev | cut -d ' ' -f1 | rev )
    foundInfiles=$(grep -rl "$FindWord" "$1" | wc -l)
    echo "The 1st most common word is {"$FindWord"} across "$foundInfiles" files"
    
elif [ "$1" == "-nth" ]



then
    
    cat $3/*.txt > all.txt
    number=$(($2+1))
    
    FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | head -n "$number"| tail -1 | rev | cut -d ' ' -f1 | rev )
    foundInfiles=$(grep -rl "$FindWord" "$3" | wc -l)
    uniqWordsCount=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | wc -l )
    
    
    if [[ "$2" =~ ^[+-]?[0-9]+$ ]] &&  (("$2" >= "1" && "$2"  <= "$uniqWordsCount"))
    then
        echo "The "$2"th most common word is {"$FindWord"} across "$foundInfiles" files"
    else
        echo "invalid input"
    fi
    
    
elif [ "$1" == "-w" ]

then
    
    filesList=$(grep -rl "$2" "$3")
    findRank=$(for FILE in $filesList;
        do
            
            tt=$(tr -c '[:alnum:]' '[\n*]' < $FILE | sort | uniq -c | sort -nr | grep -n -w "$2"  )
            echo "$tt $FILE" ;
            
    done)
    
    findHighestRank=$( echo "$findRank" | sort -nr | tail -n1 | cut -d: -f1)
    findHighestRank=$(($findHighestRank-1))
    findHighestRankedFile=$( echo "$findRank" | sort -nr | tail -n1 | rev | cut -d ' ' -f1 | rev | cut -d / -f2  )
    
    echo "The most significant rank for the word {"$2"} is {"$findHighestRank"} in file {"$findHighestRankedFile"} "
    
    
else 
    echo "invalid input"
    
fi
