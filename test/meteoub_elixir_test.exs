require IEx

defmodule MeteoubElixirTest do
  use ExUnit.Case

  @tag timeout: 60_000 # 60 ms

  test "fetch weather data" do
    response = MeteoubElixir.fetch_weather_data
    assert 200 == response.status_code
  end
end
