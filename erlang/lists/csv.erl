fun(Head, {Req}) ->
  Fun = fun({Row}, Acc) ->
    Id = couch_util:get_value(<<"id">>, Row),
    [A|[B|[C]]]= couch_util:get_value(<<"key">>, Row),
    Value=couch_util:get_value(<<"value">>, Row),
	Send([A,<<"/">>,B,<<",">>,C,<<",">>,integer_to_binary(Value),<<"\n">>]),
    {ok,Id}
  end,
  FoldRows(Fun, nil),
  ""
end.
