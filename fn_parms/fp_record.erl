-module(fp_record).
-export([main/0]).
-export([main/1]).
-export([records/2]).

main() ->
    main(10000).

main(LoopCt) ->
    io:format("fp_record results:~p~n",[
                            timer:tc(fp_record,records,[init,LoopCt]) ]).

%%% Record version which permits use of named fields.
%%% Erlang's translation of record syntax into tagged tuples causes
%%% minor performance hit.
%%%
%%% Note how call to records uses existing R as initial value
%%% permitting implicit carry-over of un-modified values (in this
%%% case the hue field only).
-record(no_tuple, {count,x,y,colors,hues,vertices}).

records(init,LoopCt) ->
    records(#no_tuple{count=LoopCt,x=1,y=2,colors=100,hues=200,vertices=99}).

records(#no_tuple{count=Count,x=X,y=Y,vertices=Vertices} = R) ->
    if 
        Count > 0 ->
            NewX = X+1,
            records(R#no_tuple{count=Count-1,x=NewX,y=Y-1,
                                    colors=50+NewX,vertices=-Vertices});
        true -> R
    end.
