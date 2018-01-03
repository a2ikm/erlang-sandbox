-module(guard).
-export([bigger/2, guard_test/1]).

bigger(X , Y) when X > Y ->
    X;
bigger(X , Y) when X < Y ->
    Y;
bigger(X , _Y) ->
    io:format("same~n",[]),
    X.

guard_test(X) when 1 < X, X < 5 ->
  X;
guard_test(_) ->
  0.
