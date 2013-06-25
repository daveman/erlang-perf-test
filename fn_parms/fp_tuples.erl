-module(fp_tuples).
-export([main/0]).
-export([main/1]).
-export([tuples/1]).

main() ->
    main(10000).

main(LoopCt) ->
    io:format("fp_tuples results:~p~n",[
                            timer:tc(fp_tuples,tuples,[LoopCt]) ]).

%%% Uses nested tuples to organize related values.
%%% Takes performance hit from destructuring.
tuples(LoopCt) ->
    tuples(LoopCt,{1,2},{100,200},99).
tuples(Count,_Coords={X,Y},_Attributes={Colors,Hues},Vertices) ->
    if 
        Count > 0 ->
            NewX = X+1,
            tuples(Count-1,{NewX,Y-1},{50 + NewX,Hues},-Vertices);
        true -> {Count,X,Y,Colors,Hues,Vertices} 
    end.


