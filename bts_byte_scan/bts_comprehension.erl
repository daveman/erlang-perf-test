-module(bts_comprehension).
-export([start/0]).
-export([startloop/1]).


-define(S,
        %%%    12345678901234567890123456789012
            <<"The 1 quick brown fox jumped 3 f"
              "eet over the 21 lazy dogs !!!!!!" >>).

start() ->
    start(1000000).

start(LoopCt) ->
    io:format("[bts,bts_comprehension,~p]~n",[
                            timer:tc(bts_comprehension,startloop,[LoopCt]) ]).

startloop(LoopCt) ->
    loop(LoopCt).

loop(Count) ->
   %<< <<X:8>> || <<X:8>> <= S >>.
   A = << <<(
                if
                    (X >= $0) and (X =< $9) -> $?;
                    true -> X
                end
            ):8>> || <<X:8>> <= ?S >>,
    if
        Count > 0 ->
            loop(Count-1);
        true -> A
    end.


