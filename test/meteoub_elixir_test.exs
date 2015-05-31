require IEx

defmodule MeteoubElixirTest do
  use ExUnit.Case

  @tag timeout: 1_000_000

  test "fetch_weather_data" do
    response = MeteoubElixir.fetch_data
    assert 200 == response.status_code
  end

  test "splitted_data" do
    list = MeteoubElixir.splitted_data
    assert is_list(list)
  end
end
