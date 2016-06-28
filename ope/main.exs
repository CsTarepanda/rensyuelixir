defmodule Operators do
  defmacro a - b do
    quote do
      to_string(unquote(a)) <> to_string(unquote(b)) <> "ok"
    end
  end
  defmacro a + b do
    quote do
      to_string(unquote(a)) <> to_string(unquote(b)) <> "oooo"
    end
  end
end

defmodule Test do
  IO.puts(123 + 456)             #=> "579"
  import Kernel, except: [-: 2, +: 2, <>: 2]
  import Operators
  IO.puts(123 - 456)             #=> "123456"
  IO.puts(123 + 456)             #=> "123456"
  IO.puts "test" &&& "kona"
end

IO.puts(123 + 456)               #=> "579"
