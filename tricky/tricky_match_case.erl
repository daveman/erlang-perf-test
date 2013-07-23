-module(tricky_match_case).
-export([start/0]).
-export([loop/1]).

start() ->
    start(10000000),
    halt.

start(LoopCt) ->
    io:format("tricky_match_case results,~p~n",[
                            timer:tc(tricky_match_case,loop,[LoopCt]) ]).

%
loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,X,Acc) ->
    NewAcc = Acc + 1,

    NewX =
           case X of
                1 -> -1;
               -1 -> 1
            end * -1,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.



