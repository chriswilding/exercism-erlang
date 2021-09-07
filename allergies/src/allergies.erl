-module(allergies).

-export([allergies/1, is_allergic_to/2]).

-define(SUBSTANCES, #{
    eggs =>  1,
    peanuts => 2,
    shellfish => 4,
    strawberries => 8,
    tomatoes => 16,
    chocolate => 32,
    pollen => 64,
    cats => 128
}).

allergies(Score) ->
    [Substance || Substance <- maps:keys(?SUBSTANCES), is_allergic_to(Substance, Score)].

is_allergic_to(Substance, Score) ->
    Item = maps:get(Substance, ?SUBSTANCES),
    (Item band Score) > 0.
