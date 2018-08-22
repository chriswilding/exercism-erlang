-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

count(Dna, N) when N =:= "A"; N =:= "T"; N =:= "C"; N =:= "G" ->
    lists:foldl(
      fun
          (Base, Acc) when [Base] =:= N -> Acc + 1;
          (_, Acc) -> Acc
      end,
      0,
      Dna
     );
count(_, _) ->
    erlang:error("Invalid nucleotide").

nucleotide_counts(Dna) ->
    {A, T, C, G} =
    lists:foldl(
      fun
          ($A, {AccA, AccT, AccC, AccG}) -> {AccA + 1, AccT, AccC, AccG};
          ($T, {AccA, AccT, AccC, AccG}) -> {AccA, AccT + 1, AccC, AccG};
          ($C, {AccA, AccT, AccC, AccG}) -> {AccA, AccT, AccC + 1, AccG};
          ($G, {AccA, AccT, AccC, AccG}) -> {AccA, AccT, AccC, AccG + 1}
      end,
      {0, 0, 0, 0},
      Dna
     ),
    [{"A", A}, {"T", T}, {"C", C}, {"G", G}].

test_version() -> 1.
