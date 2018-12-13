fun(Head, {Req}) ->
  [{<<"id">>,Query}|_] = element(1,couch_util:get_value(<<"query">>, Req, {[]})),
  [C|Is]=string:tokens(binary_to_list(Query),"/"),
  Container=list_to_binary(C),
  Key=list_to_binary(string:join(Is,"/")),
  Fun = fun({Row}, Acc) ->
    Id = couch_util:get_value(<<"id">>, Row),
    Dt = couch_util:get_value(<<"key">>, Row),
    {Doc} = couch_util:get_value(<<"doc">>, Row),
	{Env} = proplists:get_value(<<"data">>, Doc,null),
	case proplists:get_value(Container, Env,null) of
		{B1} -> case proplists:get_value(Key, B1,null) of
				  X -> Send(list_to_binary(io_lib:format("~s,~p~n", [Dt,X]))),{ok, Id}
				end;
		_ -> {ok, Id}
	end
  end,
  FoldRows(Fun, nil),
  ""
end.
