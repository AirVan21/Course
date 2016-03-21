#!/bin/bash

# 1. Takes first $RANDOM strings from pseudo-random

eval 'head -$RANDOM /dev/urandom > rnd.txt'