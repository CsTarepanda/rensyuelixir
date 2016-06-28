defmodule Main do
  def main(n) when n === 0, do: 1
  def main(n) do
    main(n - 1) * n
  end
end

Main.main(100000)
