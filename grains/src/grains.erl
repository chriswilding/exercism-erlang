-module(grains).

-export([square/1, total/0, test_version/0]).

square(N) ->
    1 bsl (N - 1).

total() ->
    1 bsl 64 - 1.

test_version() -> 1.
