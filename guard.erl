-module(guard).
-export([bigger/2]).

bigger(X , Y) when X > Y ->
    X;
bigger(X , Y) when X < Y ->
    Y;
bigger(X , _Y) ->
    io:format("same~n",[]),
    X.
