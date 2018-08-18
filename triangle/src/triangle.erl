-module(triangle).

-export([kind/3, test_version/0]).

kind(A, B, C) when A =< 0; B =< 0; C =< 0 ->
    {error, "all side lengths must be positive"};
kind(A, B, C) when not (A + B > C andalso B + C > A andalso C + A > B) ->
    {error, "side lengths violate triangle inequality"};
kind(A, B, C) when A =:= B, B =:= C ->
    equilateral;
kind(A, B, C) when A =:= B; B =:= C; C =:= A ->
    isosceles;
kind(_, _, _) ->
    scalene.

test_version() -> 1.
