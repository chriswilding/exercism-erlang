-module(secret_handshake).

-export([commands/1]).

commands(Number) when Number band 2#10000 =:= 2#10000 ->
    commands(Number, [2#1000, 2#0100, 2#0010, 2#0001]);
commands(Number) ->
    commands(Number, [2#0001, 2#0010, 2#0100, 2#1000]).

commands(Number, Flags) ->
    [action(X) || X <- Flags, Number band X =:= X].

action(2#0001) -> "wink";
action(2#0010) -> "double blink";
action(2#0100) -> "close your eyes";
action(2#1000) -> "jump".
