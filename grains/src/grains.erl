-module(grains).

-export([square/1, total/0, test_version/0]).

square(1) ->
    1;
square(N) ->
    2 * square(N - 1).

total() ->
    square(65) - 1.

test_version() -> 1.
