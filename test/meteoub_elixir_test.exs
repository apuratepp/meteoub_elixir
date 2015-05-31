require IEx

defmodule MeteoubElixirTest do
  use ExUnit.Case

  @tag timeout: 1_000_000

  test "fetch" do
    assert 200 == MeteoubElixir.fetch.status_code
  end

  test "split" do
    assert is_list(MeteoubElixir.split)
  end

  test "parse" do
    assert is_list(MeteoubElixir.parse)
  end
end
