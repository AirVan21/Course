#! /bin/bash

# 1. Merges unique strings
# 2. Randomize output
# 3. Number output

if [ $1 ]
then
    eval 'sort $1 | uniq | sort --random-sort | cat -n'
else
    echo 'Please, enter a filename as a first parameter.'
fi