defmodule MeteoubElixir do
  use HTTPotion.Base

  def example_function do
    response = HTTPotion.get "http://infomet.am.ub.es/campbell/www.dat"

  end
end
