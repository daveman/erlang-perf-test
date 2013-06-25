-module(match_fn_head).
-export([main/1]).
-export([main/0]).
-export([loop/1]).

main() ->
    main(1000000),
    halt.

main(LoopCt) ->
    io:format("match_fn_head results:~p~n",[
                            timer:tc(match_fn_head,loop,[LoopCt]) ]).

%
loop(LoopCt) ->
    loop(LoopCt,{1,3},0).
loop(LoopCt,X={FlipFlop,IncBy},Acc) -> 
    NewAcc = Acc +  
                    ck_flip(X),

    if 
        Acc < LoopCt ->
            loop(LoopCt,{FlipFlop bxor 1,IncBy},NewAcc);
        true -> NewAcc 
    end.

ck_flip({0,_C}) -> 0;
ck_flip({1,C}) -> C.


