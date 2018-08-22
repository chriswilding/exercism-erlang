-module(armstrong_numbers).

-export([is_armstrong_number/1, test_version/0]).

is_armstrong_number(Number) ->
    NOfDigits = trunc(math:log10(Number) + 1),
    Digits = digits(Number, NOfDigits),
	Result = [trunc(math:pow(D, NOfDigits)) || D <- Digits],
    lists:sum(Result) =:= Number.

digits(Number, NOfDigits) ->
    Seq = lists:seq(1, NOfDigits),
    lists:map(fun(N) -> nth_digit(Number, N) end, Seq).

nth_digit(Number, N) ->
    Dividend = Number rem trunc(math:pow(10, N)),
    Dividend div trunc(math:pow(10, N - 1)).

test_version() -> 1.
