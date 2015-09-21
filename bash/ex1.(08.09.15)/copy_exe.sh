#!/bin/bash

if [[ "$#" == 4 ]]
then
    if [[ "$1" == -i ]]
    then
        iExsists=true
        srcdir=$2
    fi

    if [[ "$1" == -o ]]
    then
        oExsists=true
        dstdir=$2
    fi

    if [[ "$3" == -i ]]
    then
        iExsists=true
        srcdir=$4
    fi

    if [[ "$3" == -o ]]
    then
        oExsists=true
        dstdir=$4
    fi
else
    echo "Wrong amount of arguments!"
fi

if [[ "$oExsists" == true && "$iExsists" == true ]]
then
    IFS=$'\n'
    fileToCopy=$(find "${srcdir}" -type f -perm /a+x)
    for file in $fileToCopy
    do
        cp --parents "$file" "$dstdir"
    done
else
    echo "Forgotten key!"
fi

