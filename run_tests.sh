#!/bin/bash
# $1=search spec, $2=number of runs per test
#s=search_<s>pec, c=run_<c>ount, o=compiler_<o>ptions

#-o if more than one option is used, the entire list of options should
#   be enclosed in qoutes.
#example:
#   To inline 

search_spec=
run_ct=10
compiler_options=

while getopts s:c:o: opt; do
    case $opt in
        s)
            search_spec=$OPTARG
            ;;
        c)
            run_ct=$OPTARG
            ;;
        o)
            compiler_options=$OPTARG
            ;;
        \?) echo "Invalid option: -$OPTARG"
            echo "Bad option specified, must be -s, -c or -o."
            exit 1
            ;;
    esac
    #echo "loop"
done

#echo "search_spec=$search_spec"
#echo "run_ct=$run_ct"
#echo "compiler_options=$compiler_options"

cat /dev/null > results.txt

if ! [ $run_ct ]; then
    run_ct=1
fi

#run 1st time with compile
find . -name $search_spec -exec bash run_one.sh {} "$compiler_options" \;

run_ct=$((run_ct - 1))

while [ $run_ct \> 0 ] ; do
    find . -name $search_spec -exec bash run_one_no_compile.sh {} "$compiler_options" \;
    run_ct=$((run_ct - 1))
done

