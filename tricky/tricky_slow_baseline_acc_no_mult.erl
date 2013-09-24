-module(tricky_slow_baseline_acc_no_mult).
-export([start/0]).

start() ->
    start(10000000),
    halt.

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun loop/1,[LoopCt]) ]).

loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,_X,Acc) ->
    NewAcc = Acc + 1,

    NewX = Acc,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.



