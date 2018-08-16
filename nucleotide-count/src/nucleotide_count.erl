-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

-define(VALID_NUCLEOTIDES, ["A", "T", "C", "G"]).

count(Dna, N) ->
    case lists:member(N, ?VALID_NUCLEOTIDES) of
        true ->
            length(lists:filter(fun(Base) -> [Base] == N end, Dna));
        false ->
            erlang:error("Invalid nucleotide")
    end.

nucleotide_counts(Dna) ->
    [
     {"A", count(Dna, "A")},
     {"T", count(Dna, "T")},
     {"C", count(Dna, "C")},
     {"G", count(Dna, "G")}
    ].

test_version() -> 1.
