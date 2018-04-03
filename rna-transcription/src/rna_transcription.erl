-module(rna_transcription).

-export([to_rna/1, test_version/0]).

complement($C) -> $G;
complement($G) -> $C;
complement($T) -> $A;
complement($A) -> $U;
complement(_) -> error.

invalid(Strand) ->
    lists:any(fun(C) -> complement(C) == error end, Strand).

to_rna(Strand) ->
    case invalid(Strand) of
        true -> error;
        _    -> lists:map(fun complement/1, Strand)
    end.

test_version() -> 2.
