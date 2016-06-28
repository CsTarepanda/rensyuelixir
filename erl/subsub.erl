-module(subsub).
-export([main/1]).

main(_) ->
  io:fwrite("Hello "),
  io:fwrite("world~p~n", [add(50, 66)]).

add(X, Y) -> X + Y.


