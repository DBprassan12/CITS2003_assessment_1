

sortingVariable=$(tail incedenceOfMalaria.csv -n +2 | cut -d, -f3 | sort | uniq )



rate=$( echo $sortingVariable | tail -n1)

minYear=$(tail incedenceOfMalaria.csv -n +2 | cut -d, -f3 | sort | uniq | head -n1 )
MaxYear=$(tail incedenceOfMalaria.csv -n +2 | cut -d, -f3 | sort | uniq | tail -n1)


echo $minYear
echo $MaxYear
echo $rate
