-module(match_case).
-export([main/1]).
-export([main/0]).
-export([loop/1]).

main() ->
    main(1000000),
    halt.

main(LoopCt) ->
    io:format("match_case results:~p~n",[
                            timer:tc(match_case,loop,[LoopCt]) ]).

%
loop(LoopCt) ->
    loop(LoopCt,{1,3},0).
loop(LoopCt,X={FlipFlop,IncBy},Acc) -> 
    NewAcc = Acc + 
                    case X of
                        {0,_C} -> 0;
                        {1,C} -> C 
                    end,
    if 
        Acc < LoopCt ->
            loop(LoopCt,{FlipFlop bxor 1,IncBy},NewAcc);
        true -> NewAcc 
    end.


