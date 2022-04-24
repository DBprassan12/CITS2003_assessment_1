#!/bin/bash


read -p "Enter a Year or a Country: " input
sortingVariable=$(tail incedenceOfMalaria.csv -n +2|sort -k 1 -t, -n|sort -k 4 -t, -n|grep $input|tail -n1)


if [[ $input =~ ^[+-]?[0-9]+$ ]] && grep -q $input incedenceOfMalaria.csv

then
    
    rate=$($sortingVariable|cut -d, -f4)
    country=$($sortingVariable|cut -d, -f1)
    
    echo For the year $input, the country with the highest incidence was $country, with a rate of $rate per 1,000
    
    
elif grep -q $input incedenceOfMalaria.csv

then
    
    year=$($sortingVariable|cut -d, -f3)
    rate=$($sortingVariable|cut -d, -f4)
    
    echo For the country $input, the year with the highest incidence was $year, with a rate of$rate  per 1,000
    
    
else
    echo input not found
fi




























