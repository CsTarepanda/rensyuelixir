urls = [
  "jquery/jquery",
  "angular/angular",
  "facebook/react",
  "PuerkitoBio/goquery",
  "revel/revel",
  "lhorie/mithril.js",
  "riot/riot",
  "atom/atom",
  "Microsoft/TypeScript",
  "Microsoft/vscode",
  "docker/docker",
  "JuliaLang/julia",
  "nim-lang/Nim",
  "elixir-lang/elixir",
  "philss/floki",
  "takscape/elixir-array",
  "neovim/neovim",
]

urls
|> Enum.map(&(fn -> Testapp.fetch_content &1 end |> Task.async))
|> Enum.map(&(Task.await &1, 10000))
|> Enum.sort(fn a, b ->
  {_, _, i1} = a
  {_, _, i2} = b
  Timex.Date.compare(i1, i2) >= 0 end
) |> Enum.each(&(Testapp.put_a_formatted_line &1))
