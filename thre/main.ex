defmodule Test do
  def main(n) do
    :timer.sleep(n*3000)
    IO.inspect n
    n < 3
  end
end

[1, 2, 3, 4, 5]
  |> Enum.map(&(Task.async fn -> Test.main &1 end))
  |> Enum.map(&(Task.await &1))
  |> IO.inspect
