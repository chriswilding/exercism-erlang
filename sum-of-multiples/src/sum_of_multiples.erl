-module(sum_of_multiples).

-export([sumOfMultiples/2, test_version/0]).

sumOfMultiples(Multiples, Limit) ->
    Range = lists:seq(1, Limit - 1),
    Filtered = lists:filter(fun(N) -> lists:any(fun(M) -> N rem M =:= 0 end, Multiples) end, Range),
    lists:sum(Filtered).

test_version() -> 1.
