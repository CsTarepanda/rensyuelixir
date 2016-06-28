defmodule Hello do
  @val 10
  def world do
    IO.puts "Hello, elixir!!"
    for x <- 1..5, do: IO.puts x
    IO.puts "10 % 3 rem -> #{rem @val, 3}"
  end

  def strs do
    IO.puts "aaa" <> "bbb"
    Enum.join(String.split("aiueo,kona,test", ~r/[a,]/), "@") |> IO.puts
    String.length("test") |> IO.puts
    str = "test"
    [{idx, _}] = Regex.run(~r/st/, str, return: :index)
    IO.puts "index: #{idx}"
  end

  def lists do
    ary = [1, 2, 3]
    [a|tail] = ary
    IO.puts a
    IO.puts tail
  end
end

Hello.lists
