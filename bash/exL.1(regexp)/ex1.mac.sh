#!/bin/bash

if [ $1 ]
then
    grep -P "^([\dA-Fa-f]{2}:){5}[\dA-Fa-f]{2}$" "$1"
else
    echo "Input a paramter!"
fi