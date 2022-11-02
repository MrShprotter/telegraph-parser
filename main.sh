#!/bin/bash
lcount=0
larr=()
vall=0
for link in $(gum write --placeholder "Links")
do
    python main.py $link >> links$lcount.txt
    larr+=(links$lcount.txt)
    lcount=$(( $lcount+1 ))
    echo ${larr[@]}
    echo $lcount
done

function find_in_arr {
    for hm in $patts
    do
        if [ $1 == $hm ]; then
            vall=1
        fi
    done
}

patts=$(gum write --placeholder "Igore pattern")

count=0
loc_count=0
arr=()
for ff in ${larr[@]}
do
    echo ${larr[@]}
    loc_count=0
    for var in $(cat $ff)
    do
        loc_count=$(( loc_count+1 ))
        find_in_arr $loc_count
        if [ $vall == 0 ]; then
            wget $var -O $count.png
            arr[$count]=$count.png
            count=$(( count+1 ))
        fi
        vall=0
        echo $ff
    done
done

tar -cf $(gum input --placeholder "CBT name").cbt ${arr[@]}
rm *.png
rm *.txt
