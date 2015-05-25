defmodule MeteoubElixir do
  def fetch_weather_data do
    HTTPotion.start
    HTTPotion.get("http://infomet.am.ub.es/campbell/www.dat")
  end
end
