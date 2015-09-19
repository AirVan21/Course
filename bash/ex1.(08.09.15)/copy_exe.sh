#!/bin/bash

matchI=0
matchO=0
index=0
arr[$index]=0

for i in $@
do
    if [[ "$i" == "-i" ]]
    then
        let matchI=matchI+1
    fi
    
    if [[ "$i" == "-o" ]]
    then
        let matchO=matchO+1
    fi

    if [[ "$i" != "-i" && "$i" != "-o" ]]
    then
        arr[$index]=$i
        let index=index+1
    fi

done

if [[ $matchO > 0 && $matchI > 0 ]]
then
    # 1. Copies whole directory
    # 2. Finds only non-executable
    # 3. Deletes non-executable
    
    cp -r ${arr[0]}* ${arr[1]}
    find ${arr[1]} -type f -not -perm /a+x | xargs rm
else
    echo "Wrong keys!"
fi

