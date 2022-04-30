#!/bin/bash

read -p "Enter fileName " fileName
read -p "Enter Number " Orignalnumber


cat $fileName/*.txt > temp.txt
 number=$(($Orignalnumber+1))


Word=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | head -n "$number" | tail -1 | cut -d " " -f4)

foundInfiles=$(grep -rl and "$fileName" | wc -l)



echo The "$Orignalnumber"th most common word is "$Word" across "$foundInfiles" files



rm temp.txt
