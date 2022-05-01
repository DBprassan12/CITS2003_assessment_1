#!/bin/bash

read -p "Enter fileName " fileName
read -p "Enter Number " Orignalnumber



cat $fileName/*.txt > temp.txt

number=$(($Orignalnumber+1))


# function Nt

Word=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | 
sort | uniq -c | sort -nr | head -n "$number" | tail -1 | rev | cut -d' ' -f1 |rev)
uniqWords=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | wc -l )
foundInfiles=$(grep -rl "$Word" "$fileName" | wc -l)




# function W 










if [[ "$Orignalnumber" =~ ^[+-]?[0-9]+$ ]] &&  (("$Orignalnumber" >= "1" && "$Orignalnumber"  <= "$uniqWords"))

then echo The "$Orignalnumber"th most common word is {"$Word"} across "$foundInfiles" files

else echo bruh








fi











rm temp.txt