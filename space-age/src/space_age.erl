-module(space_age).

-export([age/2]).

-define(ORBITAL_PERIODS, #{
    earth => 1,
    mercury => 0.2408467,
    venus => 0.61519726,
    mars =>  1.8808158,
    jupiter => 11.862615,
    saturn => 29.447498,
    uranus =>  84.016846,
    neptune => 164.79132
}).

-define(SECONDS_IN_YEAR_ON_EARTH, 31557600).

age(Planet, Seconds) ->
    OrbitalPeriod = maps:get(Planet, ?ORBITAL_PERIODS),
    Seconds / (?SECONDS_IN_YEAR_ON_EARTH * OrbitalPeriod).
