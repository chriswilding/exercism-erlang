-module(perfect_numbers).

-export([classify/1, test_version/0]).

classify(1) ->
	deficient;
classify(2) ->
	deficient;
classify(N) when N > 2 ->
	Factors = factors(N),
    Sum = lists:sum(Factors),
    classify(N, Sum);
classify(_) ->
    {error, "Classification is only possible for natural numbers."}.

classify(N, N) ->
    perfect;
classify(N, Sum) when N < Sum ->
    abundant;
classify(_, _) ->
    deficient.

factors(N) ->
    Limit = N div 2 + 1,
    Seq = lists:seq(1, Limit),
    [S || S <- Seq, N rem S =:= 0].

test_version() -> 1.
