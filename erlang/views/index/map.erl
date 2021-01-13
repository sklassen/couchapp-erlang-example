fun({Doc}) ->
	case proplists:get_value(<<"data">>, Doc,null) of
		{Data}-> Dt = proplists:get_value(<<"_id">>, Doc,null),
                [ [ Emit([Container,Key,Dt],Value) || {Key,Value} <-Contains ] || {Container,{Contains}} <- Data];
		_ -> ok
	end
end.
