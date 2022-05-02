#!/bin/bash

# Divij Bhaw
# Assignment 1 2022 class CITS2003
# TASK TWO

# Default function ------------------------------------------------------------------------------

if [[ -d "$1" ]] ;
#Check if first argument is a folder

then
    cat $1/*.txt > all.txt
    #copy all files found in folder in one txt file called all.txt
    
    FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | head -n2 | tail -1 | rev | cut -d ' ' -f1 | rev )
    # This command sort all words found in all.txt and count uniq words and sorts the ranked word
    # "head -n2 | tail -1" is used because of " " being counted in the rankings, then i cut spaces and find the highest word
    # "rev | cut -d ' ' -f1 | rev" this is being used to find the last string in Line
    
    foundInfiles=$(grep -rl "$FindWord" "$1" | wc -l)
    #grep and find how many files the words appears
    
    echo "The 1st most common word is {"$FindWord"} across {"$foundInfiles"} files"
    #output results
    
    rm all.txt
    #remove temp file used for sorting to keep things clean
    
    #-NTH function ------------------------------------------------------------------------------
    
elif [ "$1" == "-nth" ]
#Check if first argument is "-nth"

then
    
    cat $3/*.txt > all.txt
    #copy all files found in folder in one txt
    
    number=$(($2+1))
    #account for " " being ranked
    
    FindWord=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | head -n "$number"| tail -1 | rev | cut -d ' ' -f1 | rev )
    #same sort function as seen above except greping input rank to find the common word
    
    foundInfiles=$(grep -rl "$FindWord" "$3" | wc -l)
    #grep and find how many files the words appears in folder found in third argument
    
    uniqWordsCount=$(tr -c '[:alnum:]' '[\n*]' < ./all.txt | sort | uniq -c | sort -nr | wc -l )
    #count how many uniq words found in the folder. this will be used to catch errors
    
    uniqWordsCount=$(($uniqWordsCount-1))
    #account for " " being ranked
    
    if [[ "$2" =~ ^[+-]?[0-9]+$ ]] && (("$2" >= "1" && "$2"  <= "$uniqWordsCount"))
    #check input is an interger and the input is between 1 and the number of uniq words found
    
    then
        echo "The "$2"th most common word is {"$FindWord"} across {"$foundInfiles"} files"
        #output results
    else
        echo "invalid number or input , rank not found "
        #catch any errors
    fi
    
    rm all.txt
    #remove temp file used for sorting to keep things clean
    
    #-W function ------------------------------------------------------------------------------
    
elif [ "$1" == "-w" ] && (grep -r -q "$2" "$3")
#Check if first argument is "-W" and if word is found in folder

then
    
    filesList=$(grep -rl "$2" "$3")
    #grep and find all folders with the words in it
    
    findRankLoop=$(for FILE in $filesList;
        do
            findRankInEachFile=$(tr -c '[:alnum:]' '[\n*]' < $FILE | sort | uniq -c | sort -nr | grep -n -w "$2"  )
            echo "$findRankInEachFile $FILE" ;
    done)
    #for loop to iterate through the file to find rank
    #grep highest rank of words from each line and ehco word and file it was in
    
    
    findHighestRank=$( echo "$findRankLoop" | sort -nr | tail -n1 | cut -d: -f1)
    findHighestRank=$(($findHighestRank-1))
    findHighestRankedFile=$( echo "$findRankLoop" | sort -nr | tail -n1 | rev | cut -d ' ' -f1 | rev | cut -d / -f2  )
    # set variables for file and rank , account for " " being rankekd
    
    echo "The most significant rank for the word {"$2"} is {"$findHighestRank"} in file {"$findHighestRankedFile"} "
    #output results
    
else
    echo " word not found or invalid input"
    #catch any errors
fi



