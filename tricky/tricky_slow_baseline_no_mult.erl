-module(tricky_slow_baseline_no_mult).
-export([start/0]).

start() ->
    start(10000000),
    halt.

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun loop/1,[LoopCt]) ]).

loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,X,Acc) ->
    NewAcc = Acc + 1,

    NewX = X,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.



