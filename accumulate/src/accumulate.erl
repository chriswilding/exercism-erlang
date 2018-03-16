-module(accumulate).

-export([accumulate/2, test_version/0]).

accumulate(Fn, Ls) ->
    accumulate(Fn, Ls, []).

accumulate(Fn, [H|T], Acc) ->
    accumulate(Fn, T, [Fn(H)|Acc]);
accumulate(_, [], Acc) ->
    lists:reverse(Acc).

test_version() -> 1.
