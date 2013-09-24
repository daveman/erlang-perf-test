Dave's Erlang Perf Tests
========================

This is my personal playground to save and compare microbenchmarks of different Erlang programming constructs, begun as a newcomer working on an implementation of the Luhny Bin coding challenge. 

Note: by comparing the relative efficiency of various Erlang language constructs, I am _not_ implying that one should use one over another in any given situation.  The choice of an efficient algorithm will typically dwarf the gains achieved by choosing, eg. one parameter passing method over another.  However, it is always nice to know the price one is paying for choosing one option over another.  Also, these benchmarks are unscientific in the sense that they do not strictly isolate the code being tested from the test environment.  That is, the tests and timings here include code that performs small amounts of work in addition to the language construct being tested.  Therefore the execution timing differences between options are _understated_ in that they include a fixed additional overhead.  I find this acceptable for my purposes. 

The benchmarks were run individually from the command prompt using the shell scripts provided.  The rationale for using this methodology (as opposed to combining the test functions into a single program) was to prevent one test from influencing the outcome (time) of a subsequent test running in the same VM instance.  

My hope is that my scripts will make it easier for others to get started in performing their own code benchmarks/comparisons.  The main script is run_tests.sh which will compile (once) and repeatedly execute multiple erlang programs using the compiler options provided to it.  An example script invocation would be:
    ./run_tests.sh -s cvfh*.erl -c 10
which would compile and run any erlang program matching the cvfhi\*.erl file pattern in any subdirectory of the current directory 10 times with the default compiler options.  Likewse:
    ./run_tests.sh -s cvfh*.erl -c 10 -o "+native"
would run the all of the same tests but would compile them using the +native option which invokes the HiPE native code compiler.  Additional options are expected to be listed inside the quotation marks and separated by spaces.

Output
======

Each of the supplied erlang benchmarks has a common boilerplate wrapper which writes it's own timing information to standard output (which is directed to resultes.txt by the run_tests.sh script.)  The output includes the compiler options used as well as the output from the script itself (to allow for verification that "competing" code actually produces the same output).  In an ideal world the output data would be read and summarize by an erlang program.  I have not yet written such a program but have instead simplified the manual analysis of the data by writing/providing a simple shell script to convert the results.txt output file into a .csv file which is easily loaded and manipulated by any spreadsheet program.  I would welcome a pull request for an erlang program to perform the analysis!

Sample Benchmarks Provided
==========================

Comparisons of related language elements are divided by directory.  As of this writing the benchmark categories include...

Tests/Test Directories
----------------------

fn_function_parameters

This directory compares the relative overhead of different parameter passing methods.  My motivation for this test was my desire to implement an algorithm in the form of a state machine where the states are represented by functions and state transitions are nested function calls (think recursive descent parser).  In my case, there was a lot of program state to be passed from function to function--leading to long and unweildy parameter lists.  I wanted to compare the relative penalties (if any) for using either tuples or records to organize the parameters.  The programs provided are:
* fnp_flat.erl -- Baseline program that runs a tail-recursive function in a tight loop making small changes to a set of 7 parameters.
* fnp_tuples.erl -- fnp_flat program modified to pass two sets of related parameters as tuples.
* fnp_record.erl -- fnp_flat program modified to pass parameters using record syntax.

Results: 
(Average of 10 of 12 runs on a Centrino Duo laptop where the fastest and slowest 2 runs are discarded.)

* fnp_flat.erl: total ms for 10 runs = 4292
* fnp_tuples.erl: total ms for 10 runs = 7652 (178% of fp_flat)
* fnp_record.erl: total ms for 10 runs = 7658 (178% of fp_flat)

As tested, the fp_tuples and fp_record versions take an additional 3/4+ longer to produce the same results.  The fact that the fp_tuples and fp_record results are very similar is to be expected given that a record is implemented internally as a "tagged tuple"--a tuple containing a leading atom followed by the parameters.  Although not tested, the fp_record solution seems likely to pull ahead of the fp_tuples version as additional tuples are added.


cvfh_match_case_vs_fn_head

It is "common knowledge" that a case statement "compiles to the same code" as a function with multiple pattern-matched heads, I wondered whether that was literally true or only figurative.  While the test code is quite contrived, the results are interesting.  I plan to review my findings with some friends before commenting here.  Feel free to grab the code and reach your own conclusions.

The test code uses an oscilating value to ensure that each of two branches of a case statement (or function head pattern) are chosen an equal number of times.

* cvfh_match_case.erl: version of a function with simple case statement
* cvfh_match_fn_head.erl: version with identical pattern match implemented as individual functions..

tricky

This directory holds some tiny tests that I used to explore counterintuitive benchmarks wherein a program which seemingly performs less work actually takes longer to execute with specific compiler options.  More explanation to follow as time permits.



