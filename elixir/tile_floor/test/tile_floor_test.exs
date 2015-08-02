defmodule TileFloorTest do
  use ExUnit.Case

  test "calculates cost to tile" do
    assert TileFloor.total_cost(10, 10, 2.00) == 200.00
  end

end
