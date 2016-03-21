#!/bin/bash

# Enter a parameter 

if [ $1 ]
then
   # Print processes file
   eval 'pgrep -l $1'
else
   echo "Enter a search parameter!"
fi