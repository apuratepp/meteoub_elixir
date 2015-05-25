defmodule MeteoubElixirTest do
  use ExUnit.Case

  test "fetch weather data" do
    response = MeteoubElixir.fetch_weather_data
    assert 200 == response.status_code
  end
end
