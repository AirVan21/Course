#!/bin/bash

# Enter input file name as a first parameter 
# Result will be printed in output .txt 

if [ $1 ]
then
   #Read input file
   numList=`cat $1`
   eval 'touch output.txt'
   
   for number in $numList
   do
        factor $number >> output.txt 
   done

else
   echo "Enter input file name as a first parameter!"
fi  