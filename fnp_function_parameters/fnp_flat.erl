-module(fnp_flat).
-export([start/0]).

start() ->
    start(10000).

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun flat_parms/1,[LoopCt]) ]).

%%% Flat six-field tuple -- efficient but unwieldy and difficult to read
flat_parms(LoopCt) ->
    flat_parms(LoopCt,1,2,100,200,99).
flat_parms(Count,X,Y,Colors,Hues,Vertices) ->
    if
        Count > 0 ->
            NewX = X+1,
            flat_parms(Count-1,NewX,Y-1,50+NewX,Hues,-Vertices);
        true -> {Count,X,Y,Colors,Hues,Vertices}
    end.

