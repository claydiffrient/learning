defmodule TileFloor do
  def total_cost(length, width, cost_per_square_foot) do
    length * width * cost_per_square_foot
  end
end
