fun(Doc, {Req}) ->
    Log("PUT Request"),
    {Query} = couch_util:get_value(<<"query">>, Req, {[]}),
    Tq = couch_util:get_value(<<"tq">>, Query, null),
    Body = case Doc of {X} -> X; _ -> [{<<"_id">>,Tq},{<<"data">>,[]}] end,
    case {couch_util:get_value(<<"dt">>, Query, null), 
          couch_util:get_value(<<"val">>, Query, null),
          couch_util:get_value(<<"data">>, Body, null) } of
        {null,_,_} -> [null,<<"requires req dt">>];
        {_,null,_} -> [null,<<"requires req val">>];
        {_,_,null} -> [null,<<"requires doc has a data element">>];
        {Dt,Val,{Data}}  -> NewData = lists:keyreplace(Dt,1,Data,{Dt,Val}),
                          [{lists:keyreplace(<<"data">>,1,Body,{<<"data">>,{NewData}})},{[{<<"body">>,<<"ok">>}]}]
    end
end.
