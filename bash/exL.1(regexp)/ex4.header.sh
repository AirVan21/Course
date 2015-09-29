#!/bin/bash

if [ $1 ]
then
    sed -r -n -e 's/\s*#\s*include\s+(<(.*)>|"(.*)")/\2\3/p' -e '$a\' "$1" 
else
    echo "Input a file name!"
fi