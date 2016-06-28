defmodule Testapp do
  import ExPrintf
  require HTTPoison
  require Floki
  require Timex
  use Timex
  def fetch_content(url) do
    HTTPoison.start
    ret = HTTPoison.get!("https://github.com/" <> url <> "/releases")
    %HTTPoison.Response{status_code: 200, body: body} = ret

    {_, _, title} = Floki.find(body, "h1") |> Floki.find("a") |> List.first
    # IO.inspect title
    {_, date} = Floki.find(body, "relative-time")
                |> Floki.attribute("datetime")
                |> List.first
                |> Timex.parse("{ISOz}")
    # IO.inspect date

    {_, _, tag} = case Floki.find(body, "span.tag-name") do
      [] -> Floki.find(body, "span.css-truncate-target")
      x  -> x
    end |> List.first
    # IO.inspect tag
    {hd(title), hd(tag), Timex.Timezone.convert(date, Timex.Timezone.local)}
  end

  def put_a_formatted_line(val) do
    {title, ver, date} = val
    diff = Timex.Date.diff(date, Timex.DateTime.today("Asia/Tokyo"), :days)
    if diff < 14 do
      printf "%-15s%-25s%s\t<<<<< updated at %s day(s) ago.\n", [
        title,
        ver,
        Timex.format!(date, "%Y.%m.%d", :strftime),
        Integer.to_string(diff)
      ]
      true
    else
      printf "%-15s%-25s%s\n", [title, ver, Timex.format!(date, "%Y.%m.%d", :strftime)]
      false
    end
  end
end

