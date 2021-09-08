-module(isbn_verifier).

-export([is_valid/1]).


is_valid(Isbn) ->
    is_valid(Isbn, 10, 0).

is_valid([], 0, Sum) ->
    Sum rem 11 == 0;
is_valid("X", 1, Sum) ->
    is_valid([], 0, Sum+10);
is_valid([$-|Rest], Index, Sum) ->
    is_valid(Rest, Index, Sum);
is_valid([Digit|Rest], Index, Sum) when Digit >= $0; Digit =< $9 ->
    Integer = (Digit - 48) * Index,
    is_valid(Rest, Index-1, Sum+Integer);
is_valid(_, _, _) ->
    false.
