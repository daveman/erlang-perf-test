-module(cvfh_match_baseline).
-export([start/0]).

start() ->
    start(40000000),
    halt.

start(LoopCt) ->
    io:format("~s,~p~n",[?MODULE_STRING,
                            timer:tc(fun loop/1,[LoopCt]) ]).

loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,_X,Acc) ->
    NewAcc = Acc + 1,

    %Looks like this assignment gets optimized out when
    %NewX = X is used. Acc used as surrogate to force
    %inclusion of cost of a single assignment.
    NewX = Acc,

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.

