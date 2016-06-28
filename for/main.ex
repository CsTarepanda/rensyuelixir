defmodule Test do
  def main, do: (
    for x <- 0..5 do
      IO.puts x
    end
  )
end

Test.main
