-module(fnp_tuples).
-export([start/0]).

start() ->
    start(10000).

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun tuples/1,[LoopCt]) ]).

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


