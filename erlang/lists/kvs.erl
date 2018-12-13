% http://adsg-l01.alphanetcapital.com:5984/mkt%2Fratefix/_design/env3/_list/kvs/dates?id=Fixing/LIBOR6M&include_docs=true&startkey=%222015%22
fun(Head, {Req}) ->
  [{<<"id">>,Query}|_] = element(1,couch_util:get_value(<<"query">>, Req, {[]})),
  [C|Is]=string:tokens(binary_to_list(Query),"/"),
  Container=list_to_binary(C),
  Key=list_to_binary(string:join(Is,"/")),
  Fun = fun({Row}, Acc) ->
    Id = couch_util:get_value(<<"id">>, Row),
    Dt = couch_util:get_value(<<"key">>, Row),
    {Doc} = couch_util:get_value(<<"doc">>, Row),
	{Env} = proplists:get_value(<<"env">>, Doc,null),
	case proplists:get_value(Container, Env,null) of
		{B1} -> case proplists:get_value(Key, B1,null) of
				  X -> Send(list_to_binary(io_lib:format("~s,~p~n", [Dt,X]))),{ok, Id}
				end;
		_ -> {ok, Id}
	end
	%FXRate = proplists:get_value(<<"FXRate">>, Env, null),
	%One = proplists:get_value(<<"AUD.USD.1Y">>, FXRate, null),
    %Send(list_to_binary(io_lib:format("~p~n", [B1]))),
    %Send(list_to_binary(io_lib:format("= ~p~n", [One]))),
    %{ok, Id}
  end,
  FoldRows(Fun, nil),
  ""
end.
