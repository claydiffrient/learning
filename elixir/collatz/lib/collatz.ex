require Integer
defmodule Collatz do
  def calculate(val, steps \\ 0)

  def calculate(1, steps) do
    steps
  end

  def calculate(val, steps) do
    if Integer.is_even(val) do
      calculate(trunc(val / 2), steps + 1)
    else
      calculate((val * 3) + 1, steps + 1)
    end
  end



end
