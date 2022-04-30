#!/bin/bash

read -p "Enter fileName " fileName
read -p "Enter Number " number


cat $fileName/*.txt > temp.txt
 number=$(($number+1))


Word=$(tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | head -n "$number" | tail -1 | cut -d " " -f4)

echo "$Word"









rm temp.txt
