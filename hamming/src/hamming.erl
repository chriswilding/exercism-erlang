-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) when length(Strand1) =/= length(Strand2) ->
    {error, "left and right strands must be of equal length"};
distance(Strand1, Strand2) ->
    Pairs = lists:zip(Strand1, Strand2),
    lists:foldl(fun count/2, 0, Pairs).

count({A, A}, Sum) ->
    Sum;
count({_A, _B}, Sum) ->
    Sum + 1.
