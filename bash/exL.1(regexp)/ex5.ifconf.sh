#!/bin/bash


ifconfig | perl -pe 's/inet addr:([0-9]*).([0-9]*).([0-9]*).([0-9]*)/
                    "inet addr:"."x" x length($1)."."."x" x length($2)."."."x" x length($3)."."."x" x length($4)/gei' | 
                    sed -r -e 's/^$/----------------------------------------------------------------------------------/'