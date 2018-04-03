-module(rna_transcription).

-export([to_rna/1, test_version/0]).

complement($C) -> $G;
complement($G) -> $C;
complement($T) -> $A;
complement($A) -> $U;
complement(_) -> throw(error).

valid(Strand) ->
    lists:all(fun(C) -> lists:member(C, [$C, $G, $T, $A]) end, Strand).

to_rna(Strand) ->
    case valid(Strand) of
        true -> lists:map(fun complement/1, Strand);
        _ -> error
    end.

test_version() -> 2.
