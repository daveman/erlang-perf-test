{module, match_case}.  %% version = 0

{exports, [{loop,1},{main,0},{main,1},{module_info,0},{module_info,1}]}.

{attributes, []}.

{labels, 18}.


{function, main, 0, 2}.
  {label,1}.
    {line,[{location,"match_case.erl",6}]}.
    {func_info,{atom,match_case},{atom,main},0}.
  {label,2}.
    {allocate,0,0}.
    {move,{integer,1000000},{x,0}}.
    {line,[{location,"match_case.erl",7}]}.
    {call,1,{f,4}}.
    {move,{atom,halt},{x,0}}.
    {deallocate,0}.
    return.


{function, main, 1, 4}.
  {label,3}.
    {line,[{location,"match_case.erl",10}]}.
    {func_info,{atom,match_case},{atom,main},1}.
  {label,4}.
    {allocate_heap,0,2,1}.
    {put_list,{x,0},nil,{x,2}}.
    {move,{atom,loop},{x,1}}.
    {move,{atom,match_case},{x,0}}.
    {line,[{location,"match_case.erl",12}]}.
    {call_ext,3,{extfunc,timer,tc,3}}.
    {test_heap,2,1}.
    {put_list,{x,0},nil,{x,1}}.
    {move,{literal,"match_case results:~p~n"},{x,0}}.
    {line,[{location,"match_case.erl",11}]}.
    {call_ext_last,2,{extfunc,io,format,2},0}.


{function, loop, 1, 6}.
  {label,5}.
    {line,[{location,"match_case.erl",15}]}.
    {func_info,{atom,match_case},{atom,loop},1}.
  {label,6}.
    {move,{integer,0},{x,2}}.
    {move,{literal,{1,3}},{x,1}}.
    {call_only,3,{f,8}}.


{function, loop, 3, 8}.
  {label,7}.
    {line,[{location,"match_case.erl",17}]}.
    {func_info,{atom,match_case},{atom,loop},3}.
  {label,8}.
    {test,is_tuple,{f,7},[{x,1}]}.
    {test,test_arity,{f,7},[{x,1},2]}.
    {allocate,4,3}.
    {get_tuple_element,{x,1},0,{x,3}}.
    {get_tuple_element,{x,1},1,{x,4}}.
    {move,{x,2},{y,0}}.
    {move,{x,0},{y,1}}.
    {move,{x,4},{y,2}}.
    {move,{x,3},{y,3}}.
    {get_tuple_element,{x,1},0,{x,5}}.
    {get_tuple_element,{x,1},1,{x,6}}.
    {test,is_integer,{f,13},[{x,5}]}.
    {select_val,{x,5},{f,13},{list,[{integer,1},{f,9},{integer,0},{f,10}]}}.
  {label,9}.
    {move,{x,6},{x,0}}.
    {jump,{f,11}}.
  {label,10}.
    {move,{integer,0},{x,0}}.
  {label,11}.
    {line,[{location,"match_case.erl",18}]}.
    {gc_bif,'+',{f,0},1,[{y,0},{x,0}],{x,0}}.
    {test,is_lt,{f,12},[{y,0},{y,1}]}.
    {line,[{location,"match_case.erl",25}]}.
    {gc_bif,'bxor',{f,0},1,[{y,3},{integer,1}],{x,1}}.
    {test_heap,3,2}.
    {put_tuple,2,{x,3}}.
    {put,{x,1}}.
    {put,{y,2}}.
    {move,{x,3},{x,1}}.
    {move,{x,0},{x,2}}.
    {move,{y,1},{x,0}}.
    {call_last,3,{f,8},4}.
  {label,12}.
    {deallocate,4}.
    return.
  {label,13}.
    {line,[{location,"match_case.erl",19}]}.
    {case_end,{x,1}}.


{function, module_info, 0, 15}.
  {label,14}.
    {line,[]}.
    {func_info,{atom,match_case},{atom,module_info},0}.
  {label,15}.
    {move,{atom,match_case},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 17}.
  {label,16}.
    {line,[]}.
    {func_info,{atom,match_case},{atom,module_info},1}.
  {label,17}.
    {move,{x,0},{x,1}}.
    {move,{atom,match_case},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
