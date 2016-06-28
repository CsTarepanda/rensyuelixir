defmodule Test do
  def main do
    x = case [1, 3, 3] do
      [] -> [1, 2, 3]
      x -> x
    end
    IO.inspect x
  end
end

Test.main
