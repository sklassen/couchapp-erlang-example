fun({Doc}) ->
	case proplists:get_value(<<"data">>, Doc,null) of
		{Data}-> Dt = proplists:get_value(<<"_id">>, Doc,null),
				[ [ Emit([Container,Key],[Dt,proplists:get_value(Key,element(1,proplists:get_value(Container,Data)))]) || Key <- proplists:get_keys(element(1,proplists:get_value(Container,Data))) ] || Container <-proplists:get_keys(Data) ];
		_ -> ok
	end
end.
