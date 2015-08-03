defmodule TileFloor do
  def total_cost(length, width, cost_per_square_foot) do
    length * width * cost_per_square_foot
  end

  def total_cost(options) do
    Float.round(total_cost(
      elem(options[:length], 0),
      elem(options[:width], 0),
      elem(options[:cost], 0)
    ), 2)
  end

  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    if (elem(options, 0)[:help]) do
      IO.puts "tile_floor length width cost"
    else
      values = elem(options, 1)
      [length | tail] = values
      [width | tail2] = tail
      [cost | _] = tail2
      IO.puts "$#{total_cost(
        length: Integer.parse(length),
        width: Integer.parse(width),
        cost: Float.parse(cost)
      )}"
    end
  end

  defp parse_args(args) do
    {options, inputs, _} = OptionParser.parse(args,
      switches: [help: :boolean]
    )
    {options, inputs}
  end
end
