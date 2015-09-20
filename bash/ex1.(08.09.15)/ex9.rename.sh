#!/bin/bash
start=`date +%Y-%m-%d\ %H:%M:%S -d "1 day ago"`
end=`date +%Y-%m-%d\ %H:%M:%S -d "2 days ago"`

IFS=$'\n'
fileNames=`find ./ -type f -newermt "$end" ! -newermt "$start" -not -iname "*.sh"`

for fullName in $fileNames
do
    name=_${fullName##*/} # get the part after the last slash
    newFullName=${fullName%/*}/"$name"
    mv "$fullName" "$newFullName"
done


