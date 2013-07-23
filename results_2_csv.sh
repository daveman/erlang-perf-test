#!/bin/sh
cat results.txt | sed 's/\[//g' | sed 's/\]//g' | sed 's/{//g' | sed 's/\}//g' > results.csv

