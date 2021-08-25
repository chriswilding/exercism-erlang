-module(secret_handshake).

-export([commands/1]).

-define(ACTIONS, [
    { 1, "wink" },
    { 2, "double blink" },
    { 4, "close your eyes" },
    { 8, "jump" }
]).

-define(REVERSE, 16).

commands(Number) ->
    Actions = [ Action || { Flag, Action } <- ?ACTIONS, Number band Flag > 0 ],

    if (?REVERSE band Number) > 0 ->
        lists:reverse(Actions);
    true ->
        Actions
    end.
