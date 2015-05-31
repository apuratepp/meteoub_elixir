defmodule MeteoubElixir do
  def fetch do
    HTTPotion.start
    HTTPotion.get("http://infomet.am.ub.es/campbell/www.dat")
  end

  def split do
    fetch.body |> String.split("\n")
  end

  def parse do
    keys = [
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

    Enum.zip(keys, split)
  end
end
