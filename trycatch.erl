-module(trycatch).
-export([go/1]).

go(X) ->
  try test(X) of
    Val -> {value, Val}
  catch
      throw:_ -> io:format("Catch throw~n");
      exit:_  -> io:format("Catch exit~n");
      error:_ -> io:format("Catch error~n")
  after
    io:format("After~n")
  end.

test(X) ->
  case X of
    1 -> throw(exception);
    2 -> exit(unknown);
    3 -> error(unknown);
    _ -> true
  end.
