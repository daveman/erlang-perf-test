-module(tricky_match_case_no_mult).
-export([start/0]).

start() ->
    start(10000000),
    halt.

start(LoopCt) ->
    io:format("~s results,~p~n",[?MODULE_STRING,
                            timer:tc(fun loop/1,[LoopCt]) ]).

%
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



