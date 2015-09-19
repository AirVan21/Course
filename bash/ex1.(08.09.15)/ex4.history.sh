#!/bin/bash

if [ $1 ]
then
    cat ~/.bash_history | grep $1 | wc -l
else
    echo "Please, enter a param!"
fi