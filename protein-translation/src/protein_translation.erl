-module(protein_translation).

-export([proteins/1]).

proteins(Strand) ->
    proteins(Strand, []).

proteins([], Acc) ->
    lists:reverse(Acc);
proteins([C1, C2, C3 | Strand], Acc) ->
    case codon([C1, C2, C3]) of
        stop -> proteins([], Acc);
        AminoAcid -> proteins(Strand, [AminoAcid|Acc])
    end.

codon("AUG") -> methionine;
codon("UUU") -> phenylalanine;
codon("UUC") -> phenylalanine;
codon("UUA") -> leucine;
codon("UUG") -> leucine;
codon("UCU") -> serine;
codon("UCC") -> serine;
codon("UCA") -> serine;
codon("UCG") -> serine;
codon("UAU") -> tyrosine;
codon("UAC") -> tyrosine;
codon("UGU") -> cysteine;
codon("UGC") -> cysteine;
codon("UGG") -> tryptophan;
codon("UAA") -> stop;
codon("UAG") -> stop;
codon("UGA") -> stop.
