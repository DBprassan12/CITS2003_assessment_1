#!/bin/bash












tr -c '[:alnum:]' '[\n*]' < ./files/ADollsHouse.txt | sort | uniq -c | sort -nr | head -



rate=$( echo grep -nr 'the' ./files | cut -d/ -f2  | sort | uniq)


tr -c '[:alnum:]' '[\n*]' < ./files | xargs -0 grep 'the' |cut -d/ -f2  | sort | uni