#! /bin/bash

# Directory as a first @param
#
# Code uses fdupes utility 
# 
# sudo apt-get install fdupes

if [ $1 ]
then 
    fdupes --recurse --size --quiet "$1" | nl -bp"\s" -s"# " | sed -r -e 's/([0-9]+)#/#\1/'
    fdupes --recurse --quiet --summarize "$1"
else
    echo "Please, enter a path as a first argument!"
fi

