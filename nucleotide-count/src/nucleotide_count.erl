-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

count(Dna, N) ->
    Valid = valid(N),
    count(Dna, N, Valid).

count(Dna, N, Valid) when Valid ->
    Char = hd(N),
    Filtered = lists:filter(fun(Base) -> Base =:= Char end, Dna),
    length(Filtered);
count(_, _, _) ->
    erlang:error("Invalid nucleotide").


increment(V) ->
    V + 1.

nucleotide_counts(Dna) ->
    Map = lists:foldl(fun(Base, Acc) -> maps:update_with(Base, fun increment/1, 1, Acc) end, #{}, Dna),
    [
     {"A", maps:get($A, Map, 0)},
     {"T", maps:get($T, Map, 0)},
     {"C", maps:get($C, Map, 0)},
     {"G", maps:get($G, Map, 0)}
    ].

valid(Dna) ->
    ValidBases = sets:from_list([$A, $T, $C, $G]),
    lists:all(fun(Base) -> sets:is_element(Base, ValidBases) end, Dna).

test_version() -> 1.
