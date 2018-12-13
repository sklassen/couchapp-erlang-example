fun({Doc}, {Req}) ->
    Id = proplists:get_value(<<"_id">>, Doc,null),
    {[{<<"code">>, 200}, {<<"headers">>, {[]}}, {<<"body">>, [Id|<<"\n">>]}]}
end.
