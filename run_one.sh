#!/bin/sh
#Compile and run test

#path only
x=$1
path_only=${x%/*}

#echo "erlc -o $path_only $2 $1"

#output the "S" file for review with same compiler options
erlc -S -o $path_only $2 $1

#output the  .beam file for execution
erlc -o $path_only $2 $1

#strip path, then extension
short_name=$(echo "$1" | sed 's/.*\///')
short_name=$(echo "$short_name" | sed 's/\.erl//')

echo "Running -> $short_name"
echo -n "[compile_options,\"$2\"]," >> results.txt
erl -pa $path_only -run $short_name start \
    -run init stop -noshell >> results.txt

