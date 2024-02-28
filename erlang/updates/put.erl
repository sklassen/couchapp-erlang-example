fun(Doc, {Req}) ->
    Log("PUT Request ~p",[Doc]),
    case {couch_util:get_value(<<"dt">>, Doc, null), 
          couch_util:get_value(<<"val">>, Doc, null),
          couch_util:get_value(<<"data">>, Doc, null) } of
        {null,_,_} -> [null,<<"requires req dt">>];
        {_,null,_} -> [null,<<"requires req val">>];
        {_,_,null} -> [null,<<"requires doc has a data element">>];
        {Dt,Val,Data}  -> NewData = lists:keyreplace({Dt,Val},1,Data),
                          [lists:keyreplace({Dt,Val},1,Doc),<<"ok">>]
    end
end.
