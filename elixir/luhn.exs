defmodule Luhn do
  def verify(value) do
    # reversed = String.reverse(value)
    # IO.puts reversed
    IO.puts findDoubleSum(value, String.length(value) - 1, 0)
  end

  defp findDoubleSum(str, pos, sum) when pos > 1 do
    IO.puts pos
    grapheme = String.at(str, pos - 2)
    IO.puts grapheme
    numeric_value = Integer.parse(grapheme)
    IO.puts elem(numeric_value, 0)
    findDoubleSum(str, pos - 2, sum + elem(numeric_value, 0))
  end

  defp findDoubleSum(_str, _pos, sum) do
    sum
  end

end

IO.puts "Is your credit card number valid?  Enter it to see."

val = IO.gets "> "

IO.puts Luhn.verify val
