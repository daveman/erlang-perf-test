-module(cvfh_match_baseline).
-export([start/0]).
%-export([lopo/1]).
%576460752303423488

start() ->
    start(40000000),
    halt.

start(LoopCt) ->
    %apply(fun lopo/1,[LoopCt]),
    io:format("cvfh_match_baseline results,~p~n",[
                            timer:tc(fun lopo/1,[LoopCt]) ]).


lopo(LoopCt) ->
    lopo(LoopCt,1,0).
lopo(LoopCt,_X,Acc) ->
    NewAcc = Acc + 1,

    %Looks like this assignment gets optimized out when
    %NewX = X is used. Acc used as surrogate to force
    %inclusion of cost of a single assignment.
    NewX = Acc,

    if
        Acc < LoopCt ->
            lopo(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.

