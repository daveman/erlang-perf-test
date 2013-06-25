-module(fp_flat).
-export([main/1]).
-export([main/0]).
-export([flat_parms/1]).

main() ->
    main(10000).

main(LoopCt) ->
    io:format("fp_flat results:~p~n",[
                            timer:tc(fp_flat,flat_parms,[LoopCt]) ]).

%%% Flat six-field tuple -- efficient but unweildy and difficult to read
flat_parms(LoopCt) ->
    flat_parms(LoopCt,1,2,100,200,99).
flat_parms(Count,X,Y,Colors,Hues,Vertices) ->
    if 
        Count > 0 ->
            NewX = X+1,
            flat_parms(Count-1,NewX,Y-1,50+NewX,Hues,-Vertices);
        true -> {Count,X,Y,Colors,Hues,Vertices} 
    end.


