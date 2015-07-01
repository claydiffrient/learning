defmodule Fibonacci do
  def calculate(0) do 0 end
  def calculate(1) do 1 end

  def calculate(val) do
    calculate(val - 1) + calculate(val - 2)
  end
end

IO.puts "Calculate the Fibonacci number."

val = IO.gets "> "

IO.puts Fibonacci.calculate elem(Integer.parse(val), 0)
