-module(secret_handshake).

-export([commands/1]).

-define(ACTIONS, #{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
}).

-define(REVERSE, 16).

commands(Number) ->
    Keys = maps:keys(?ACTIONS),

    Actions = lists:foldl(fun(Flag, Actions) ->
        if (Flag band Number) > 0 ->
            [maps:get(Flag, ?ACTIONS)|Actions];
        true ->
            Actions
        end
    end, [], Keys),

    if (?REVERSE band Number) > 0 ->
        Actions;
    true ->
        lists:reverse(Actions)
    end.
