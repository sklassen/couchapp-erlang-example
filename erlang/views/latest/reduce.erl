fun(Keys,[V|Values],ReReduce) ->
    lists:foldl(fun(X, Max) -> max(X,Max) end, V, Values)
end.
