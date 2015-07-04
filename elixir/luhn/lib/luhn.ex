require IEx
defmodule Luhn do
  def verify(value) do
    # reversed = String.reverse(value)
    # IO.puts reversed
    IO.puts findDoubleSum(value, String.length(value) - 1, 0)
  end

  def findDoubleSum(str, pos, sum) when pos > 0 do
    IO.puts "Pos:#{pos}"
    grapheme = String.at(str, pos - 2)
    numeric_value = Integer.parse(grapheme)
    double_numeric = elem(numeric_value, 0) * 2
    IO.puts "Double:#{double_numeric}"
    IO.puts "Cur Sum: #{sum}"
    if (double_numeric > 9) do
      remainder = rem double_numeric, 10
      IO.puts "Rem:#{remainder}"
      findDoubleSum(str, pos - 2, sum + 1 + remainder)
    else
      findDoubleSum(str, pos - 2, sum + double_numeric)
    end

  end

  def findDoubleSum(_str, _pos, sum) do
    IO.puts sum
    sum
  end

end