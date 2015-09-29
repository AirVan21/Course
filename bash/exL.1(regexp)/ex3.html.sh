#!/bin/bash

# Mozilla Firefox deals with this .html 
if [ $1 ]
then
    sed -r -e '1i\<html>' -e '$a\<\/html>' -e 's/([^,]*),([^,]*),(.*)/<p><b>Name:<\/b>\1  <b>Surname:<\/b> \2 <b>Phone:<\/b> \3<\/p>/' "$1" > "page.html"
else
    echo "Input a file name!"
fi