#!/bin/bash


read -p "Enter a Year or a Country: " input


sortingVariable = $(tail incedenceOfMalaria.csv -n +2 | sort -k 1 -t, -n | sort -k 4 -t, -n | grep $input | tail -n1 | cut -d, -f4 )


echo $sortingVariable


myvariable=Hello
anothervar=Fred
total=($myvariable $anothervar)
echo $total













