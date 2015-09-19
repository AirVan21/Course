#!/bin/bash

# 1. Gets calendar
# 2. Cat shows all symbols(including non-dislpayed)
# 3. Greps all words with highlighted mark (_\^H)
# 4. Skips highlight mark

day=$(cal | cat -v | grep -o "_\^H[0-9]" | tr -d "_\^H\n")
echo $day