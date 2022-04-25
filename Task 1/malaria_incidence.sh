#!/bin/bash

#input=$1
# or
read -p "Enter a Year or a Country: " input

sortingVariable=$(tail incedenceOfMalaria.csv -n +2 | sort -k 1 -t, -n | sort -k 4 -t, -n |  grep -w  $input | tail -n1)


country=$( echo $sortingVariable | cut -d, -f1)
year=$( echo $sortingVariable | cut -d, -f3)
rate=$( echo $sortingVariable | cut -d, -f4)


echo $country
echo $input



if [[ $input =~ ^[+-]?[0-9]+$ ]] &&  (($input >= 2000 && $input <= 2018))

then
    echo For the year $year , the country with the highest incidence was $country , with a rate of $rate per 1,000
    
    
elif [ "$country" == "$input" ]

then
    echo For the country $country, the year with the highest incidence was $year, with a rate of $rate  per 1,000
    
else
    echo "country or year not found in file"
fi