#!/bin/bash

# Used functions just to see how is goes
greetOnline(){
        echo "Online!" | wall
}

greetOffline(){
        echo "Offline!" | wall 
}

page=$(wget -qO- http://vk.com/abramov_vanya)
#page=$(wget -qO- http://vk.com/ankuzik)
if echo "$page" | grep "<b id=\"profile_online_lv\" class=\"fl_r\">" > /dev/null
then
    greetOnline
    isOnline=true
else
    greetOffline
    isOnline=false
fi

while true
do
    sleep 59
    page=$(wget -qO- http://vk.com/abramov_vanya)
    #page=$(wget -qO- http://vk.com/ankuzik)
    if echo "$page" | grep "<b id=\"profile_online_lv\" class=\"fl_r\">" > /dev/null
    then
        if [[ "$isOnline" = false ]]
        then
            greetOnline
            isOnline=true
        fi 
    else
        if [[ "$isOnline" = true ]]
        then
            greetOffline
            isOnline=false
        fi 
    fi
done

