-module(darts).

-export([score/2]).

score(X, Y) ->
    Radius = math:sqrt(math:pow(X, 2) + math:pow(Y, 2)),
    score(Radius).

score(Radius) when Radius =< 1 ->
    10;
score(Radius) when Radius =< 5 ->
    5;
score(Radius) when Radius =< 10 ->
    1;
score(_) ->
    0.
