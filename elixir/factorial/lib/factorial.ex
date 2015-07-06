defmodule Factorial do
  def calculate(0) do
    1
  end

  def calculate(val) do
    val * calculate(val - 1)
  end
end
