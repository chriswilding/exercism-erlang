-module(collatz_conjecture).

-export([steps/1, test_version/0]).

steps(N) ->
    step(N, 0).

step(N, Steps) when N < 1 ->
    {error, "Only positive numbers are allowed"};
step(1, Steps) ->
    Steps;
step(N, Steps) when N rem 2 =:= 0 ->
    step(N div 2, Steps+1);
step(N, Steps) when N rem 2 =:= 1 ->
    step(N*3+1, Steps+1).

test_version() -> 2.
