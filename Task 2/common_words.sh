#!/bin/bash




read -p "Enter fileName " fileName
read -p "Enter file path " input2
read -p "Enter file path " input3

cat "$fileName"/*.txt > temp.txt

tr -c '[:alnum:]' '[\n*]' < ./temp.txt | sort | uniq -c | sort -nr | head -10









rm temp.txt

