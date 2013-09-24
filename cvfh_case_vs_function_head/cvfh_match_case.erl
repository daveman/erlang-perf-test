-module(cvfh_match_case).
-export([start/0]).

start() ->
    start(40000000),
    halt.

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun loop/1,[LoopCt]) ]).

loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,X,Acc) ->
    NewAcc = Acc + 1,

    NewX =
           case X of
                1 -> -1;
               -1 -> 1
            end,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.



