fun(Head, {Req}) ->
  Fun = fun({Row}, Acc) ->
    Id = couch_util:get_value(<<"id">>, Row),
    Keys= couch_util:get_value(<<"key">>, Row),
    Value= couch_util:get_value(<<"value">>, Row),
	%Send([Keys,Value,list_to_binary("~n")])
	Send([<<"\n">>]),
    {ok,Id}
  end,
  FoldRows(Fun, nil),
  ""
end.
