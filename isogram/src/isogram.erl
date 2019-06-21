-module(isogram).

-export([is_isogram/1]).

is_letter(C) ->
  lists:member(C, "abcdefghijklmnopqrstuvwxyz").

is_isogram(Phrase) -> 
  Lowercase = string:lowercase(Phrase),
  Letters = [C || C <- Lowercase, is_letter(C)],
  sets:size(sets:from_list(Letters)) =:= length(Letters).

