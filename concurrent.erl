-module(concurrent).
-export([start/0]).
start() ->
  PID = spawn(fun() -> echo(1) end),
  register(echo_pid, PID),
  PID.

echo(NoMsgCnt) ->
  receive
    shutdown ->
      io:format("Shutdown echo~n");
    {one, Msg} ->
      io:format("One Msg ~p~n", [Msg]),
      echo(NoMsgCnt);
    {two, Msg} ->
      io:format("Two Msg ~p~n", [Msg]),
      echo(NoMsgCnt);
    Unknown ->
      io:format("Unknown Msg ~p~n", [Unknown]),
      echo(NoMsgCnt)
  after
    7000 ->
      io:format("No Msg ~p~n", [NoMsgCnt]),
      echo(NoMsgCnt + 1)
  end.
