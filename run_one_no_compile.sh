#!/bin/sh
#run test without compile 

#path only
x=$1
path_only=${x%/*}

#strip path, then extension
short_name=$(echo "$1" | sed 's/.*\///')
short_name=$(echo "$short_name" | sed 's/\.erl//')

echo "Running -> $short_name"
echo -n "[compile_options,\"$2\"]," >> results.txt
erl -pa $path_only -run $short_name start \
    -run init stop -noshell >> results.txt

