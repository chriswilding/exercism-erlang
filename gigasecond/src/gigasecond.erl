-module(gigasecond).

-export([from/1]).

-define(GIGASECOND, 1000000000).

from({Date, Time}) ->
    Seconds = calendar:datetime_to_gregorian_seconds({Date, Time}),
    calendar:gregorian_seconds_to_datetime(Seconds + ?GIGASECOND);
from(Date) ->
    from({Date, {0, 0, 0}}).
