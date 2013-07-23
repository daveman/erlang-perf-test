#!/bin/sh
cat results.txt | sed 's/\[//' | sed 's/\]//' | sed 's/{//' | sed 's/\}//' > results.csv

