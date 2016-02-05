defmodule MeteoubElixir do
  @data_url "http://infomet.am.ub.es/campbell/www.dat"
  @keys [
          :date,
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

  def fetch do
    HTTPotion.start
    HTTPotion.get(@data_url)
  end

  def split do
    fetch.body |> String.split("\n")
  end

  def parse do
    Enum.zip(@keys, split)
  end

  def formatted_datetime do
    MUBDateFormatter.format_time(parse[:date], parse[:time])
  end

  def formatted_sunrise do
    MUBDateFormatter.format_time(parse[:date], parse[:sunrise])
  end

  def formatted_sunset do
    MUBDateFormatter.format_time(parse[:date], parse[:sunset])
  end

  def temperature_average do
    parse[:temperature_average]
  end

  def humidity_average do
    parse[:humidity_average]
  end

  def pressure_average do
    parse[:pressure_average]
  end

  def message do
    "Dades a les #{formatted_datetime}: #{temperature_average}ºC, #{humidity_average}%, #{pressure_average} hPa // Sortida del Sol: #{formatted_sunrise}, posta: #{formatted_sunset}"
  end
end
