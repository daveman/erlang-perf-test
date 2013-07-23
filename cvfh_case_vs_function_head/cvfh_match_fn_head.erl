-module(cvfh_match_fn_head).
-export([start/0]).
-export([loop/1]).

start() ->
    start(40000000),
    halt.

start(LoopCt) ->
    io:format("cvfh_match_fn_head results,~p~n",[
                            timer:tc(fun loop/1,[LoopCt]) ]).


loop(LoopCt) ->
    loop(LoopCt,1,0).
loop(LoopCt,X,Acc) ->
    NewAcc = Acc + 1,

    NewX = ck_flip(X),

    if
        Acc < LoopCt ->
            loop(LoopCt,NewX,NewAcc);
        true -> NewAcc
    end.

ck_flip(1) -> -1;
ck_flip(-1) -> 1.


