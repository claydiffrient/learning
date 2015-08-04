defmodule TileFloorTest do
  use ExUnit.Case

  test "calculates cost to tile" do
    assert TileFloor.total_cost(10, 10, 2.00) == 200.00
  end

  test "accepts arguments as a list" do
    assert TileFloor.total_cost(length: 10, width: 10, cost: 10.00) == 1000.00
  end

end
