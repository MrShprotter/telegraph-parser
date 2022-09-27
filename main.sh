#!/bin/bash
python main.py $(gum input --placeholder "Link") > links.txt

count=0
arr=()

for var in $(cat links.txt)
do
    wget $var -O $count.png
    arr[$count]=$count.png
    count=$(( count+1 ))
done
tar -cf $(gum input --placeholder "CBT name").cbt ${arr[@]}
