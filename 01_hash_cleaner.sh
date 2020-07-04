#!/bin/bash

word="${1}"
IFS="#" read -ra word1 <<< $word
#echo ${#word}
# for i in {0..21}; do
#     echo ${word:i-1:i}
# done
#word1[0]="hhh"
let counter=0
for i in ${word1[@]}; do  # array içinde sadece belirli bir rakama ulaşmak ve onu yazdırmak için böyle bir for döngüsü gerekiyor...
    if [[ $counter == 0 ]]; then
        echo $i 
    fi
    counter=$counter+1
done

# this is also the solution to the question...
# echo $1 | cut -d# -f1

# another solution
# echo ${1%%#*}