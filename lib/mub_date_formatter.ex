defmodule MUBDateFormatter do
  use Timex

  @date_time_format "%H:%M"

  def format_time(raw_date, raw_time) do
    [ day, month, year ] = split_datetime(raw_date, "-")
    [ hour, minute ] = split_datetime(raw_time, ":")

    { :ok, datetime } = Date.from({ { year, month, day }, { hour, minute, 0 } })
      |> DateFormat.format(@date_time_format, :strftime)

    datetime
  end

  defp split_datetime(raw, separator) do
    raw
      |> String.split(separator)
      |> Enum.map(fn(x) ->
           { a, _ } = Integer.parse(x)
           a
         end)
  end
end
