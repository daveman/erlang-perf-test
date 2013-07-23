-module(tricky_slow_baseline).
-export([start/0]).
-export([loop/1]).

start() ->
    start(10000000),
    halt.

start(LoopCt) ->
    io:format("tricky_slow_baseline results,~p~n",[
                            timer:tc(tricky_slow_baseline,loop,[LoopCt]) ]).

%
loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,X,Acc) ->
    NewAcc = Acc + 1,

    NewX = X * -1,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.



