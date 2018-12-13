fun({Doc}, {Req}) ->
	Id = proplists:get_value(<<"_id">>, Doc,null),
	{[{<<"id">>,Query}]} = couch_util:get_value(<<"query">>, Req, {[]}),
	[C|Is]=string:tokens(binary_to_list(Query),"/"),
	Key=list_to_binary(string:join(Is,"/")),
	{Env} = proplists:get_value(<<"data">>, Doc,null),
	{Container} = proplists:get_value(list_to_binary(C), Env,null),
	Value = proplists:get_value(Key, Container,null),
	R = list_to_binary(io_lib:format("<?xml version=\"1.0\">\n<object name=\"\">\n\t<key>~s</key>\n\t<value>~p</value>\n</object>\n", [Id,Value])),
	{[{<<"code">>, 200}, {<<"headers">>, {[]}}, {<<"body">>, R}]}
end.
