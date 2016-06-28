defmodule ExMain do
  def main(x, y) do
    :test.add(x, y) |> IO.inspect
    :test.add(x, y) |> IO.inspect
  end
end
