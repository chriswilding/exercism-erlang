-module(luhn).

-export([valid/1]).

valid(Value) ->
    Trimmed = string:trim(Value),
    if length(Trimmed) > 1 ->
        Reversed = lists:reverse(Trimmed),
        valid(Reversed, false, 0);
    true ->
        false
    end.

valid([$\s|Digits], Double, Sum) ->
    valid(Digits, Double, Sum);
valid([Digit|_], _, _) when Digit < $0; Digit > $9 ->
    false;
valid([Digit|Digits], true, Sum) ->
    Integer = Digit - 48,
    Result = double(Integer),
    valid(Digits, false, Sum+Result);
valid([Digit|Digits], false, Sum) ->
    Integer = Digit - 48,
    valid(Digits, true, Sum+Integer);
valid([], _, Sum) ->
    Sum rem 10 == 0.

double(Value) ->
    Integer = Value * 2,
    if Integer > 9 ->
        Integer - 9;
    true ->
        Integer
    end.
