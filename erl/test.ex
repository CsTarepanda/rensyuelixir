defmodule Test do
  require ExMain
  def add(x, y) do
    ExMain.main x, y
  end
end

Test.add 10, 20
