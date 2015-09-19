#!/bin/bash


# 1. Find (only!) files owned by user 
# 2. Counts amount of lines    
    
find . -user $USER -type f -ls | wc -l
