defmodule MeteoubElixir do
  @keys [ :date,
          :time,
          :temperature_min,
          :temperature_max,
          :temperature_average,
          :humidity_min,
          :humidity_max,
          :humidity_average,
          :pressure_min,
          :pressure_max,
          :pressure_average,
          :wind_speed_average,
          :wind_speed_max,
          :solar_irradiation_since_00_utc,
          :solar_radiation_global,
          :solar_radiation_difusse,
          :solar_radiation_ultraviolet,
          :solar_azimut,
          :solar_altitude,
          :sunrise,
          :sunset,
          :rain,
          :is_it_raining?
        ]

  defp request do
    HTTPotion.start
    HTTPotion.get(System.get_env("METEOUB_URI"))
  end

  defp body(request) do
    request.body
  end

  defp handle(body) do
    split = body |> String.split("\n")
    Enum.zip(@keys, split)
  end

  defp parse(results) do
    datetime = MUBDateFormatter.format_time(results[:date], results[:time])
    sunrise  = MUBDateFormatter.format_time(results[:date], results[:sunrise])
    sunset   = MUBDateFormatter.format_time(results[:date], results[:sunset])
    additional = [
      { :datetime, datetime },
      { :sunrise_datetime, sunrise },
      { :sunset_datetime, sunset }
    ]
    results ++ additional
  end

  def results do
    request |> body |> handle |> parse
  end

  def message(results) do
    datetime = results[:datetime]
    temperature = results[:temperature_average]
    humidity = results[:humidity_average]
    pressure = results[:pressure_average]
    sunrise = results[:sunrise_datetime]
    sunset = results[:sunset_datetime]

    "Dades a les #{datetime}: #{temperature}ºC, #{humidity}%, #{pressure} hPa // Sortida del Sol: #{sunrise}, posta: #{sunset}"
  end
end
