-module(queen_attack).

-export([can_attack/2]).

can_attack({Column, _WhiteQueenRow}, {Column, _BlackQueenRow}) ->
    true;
can_attack({_WhiteQueenColumn, Row}, {_BlackQueenColumn, Row}) ->
    true;
can_attack({WhiteQueenColumn, WhiteQueenRow}, {BlackQueenColumn, BlackQueenRow}) ->
    abs(WhiteQueenColumn - BlackQueenColumn) == abs(WhiteQueenRow - BlackQueenRow).
