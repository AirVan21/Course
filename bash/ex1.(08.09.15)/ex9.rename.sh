#!/bin/bash

fileNames=`find ./ -type f -ctime +1 -ctime -2 -not -iname "*.sh"`

for fullName in $fileNames
do
    name=_${fullName##*/}  # get the part after the last slash
    newFullName=${fullName%/*}/$name
    mv $fullName $newFullName
done


