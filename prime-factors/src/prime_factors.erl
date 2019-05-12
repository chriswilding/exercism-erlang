-module(prime_factors).

-export([factors/1]).

factors(1) ->
    [];
factors(N) ->
    Factors = factors(N, 2, []),
    lists:reverse(Factors).

factors(N, N, Factors) ->
    [N|Factors];
factors(N, Factor, Factors) when N rem Factor =:= 0 ->
    factors(N div Factor, Factor, [Factor|Factors]);
factors(N, Factor, Factors) ->
    factors(N, Factor + 1, Factors).

