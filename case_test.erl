-module(case_test).
-export([case_test/1]).

case_test(X) ->
  case X of
    X when X < 5, X > 1 -> X;
    X -> 0
  end.
