defmodule Main do
  def main(x) do
    cond do
      rem(x, 15) == 0 -> "FB"
      rem(x, 3) == 0 -> "F"
      rem(x, 5) == 0 -> "B"
      true -> x
    end
  end
end

1..30 |> Enum.map(& IO.inspect Main.main &1)
