#!/bin/bash


filesList=$(grep -rl "$1" "$2")
#echo "$filesList"




findRank=$(for FILE in $filesList;
do

        tt=$(tr -c '[:alnum:]' '[\n*]' < $FILE | sort | uniq -c | sort -nr | grep -n -w "$1"  )
        echo "$tt $FILE" ;
    
done)

findHighestRank=$( echo "$findRank" | sort -nr | tail -n1 | cut -d: -f1)
findHighestRank=$(($findHighestRank-1))



findHighestRankedFile=$( echo "$findRank" | sort -nr | tail -n1 | rev | cut -d ' ' -f1 | rev | cut -d / -f2  )


echo "The most significant rank for the word {"$1"} is {"$findHighestRank"} in file {"$findHighestRankedFile"} "











#findHighestRank=$( echo "$findRank" | sort -nr | tail -n1 | cut -d: -f1)
#findHighestRank=$(($findHighestRank-1))
#findHighestRankedFile=$( echo "$findRank" | sort -nr | tail -n1 | cut -d " " -f2 | cut -d / -f2 )

#echo $findHighestRank
#echo $findHighestRankedFile



#echo "The most significant rank for the word "$2" is "$findHighestRank" in file "$findHighestRankedFile""