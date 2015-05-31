defmodule MeteoubElixir do
  def fetch_data do
    HTTPotion.start
    HTTPotion.get("http://infomet.am.ub.es/campbell/www.dat")
  end

  def splitted_data do
    fetch_data.body |> String.split("\n")
  end
end
