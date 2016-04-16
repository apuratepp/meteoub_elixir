defmodule MeteoubElixirTest do
  use ExUnit.Case

  test "message" do
    results = MeteoubElixir.results
    assert(MeteoubElixir.message(results) == "Dades a les 21:50: 19.8ºC, 78%, 1016.0 hPa // Sortida del Sol: 04:30, posta: 19:07")
  end
end
