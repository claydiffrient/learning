require IEx
defmodule Luhn do
  def verify(value) do
    double_sum = findDoubleSum(value, String.length(value), 0)
    checksum = multiplyAndModulo(double_sum)
    last_digit = elem(Integer.parse(String.last(value)), 0)
    checksum == last_digit
  end

  def findDoubleSum(str, pos, sum) when pos > 0 do
    # Don't use the checksum digit
    if (pos - 1 == String.length(str) - 1) do
      findDoubleSum(str, pos - 1, sum)
    end
    # Gets the character at the next position
    grapheme = String.at(str, pos - 1)
    # Turns the value into an Integer
    numeric_value = Integer.parse(grapheme)
    # Check if the value was in an odd position
    if (rem(pos - 1, 2) != 0) do
      # If it was, don't double the value, just add it.
      findDoubleSum(str, pos - 1, elem(numeric_value, 0))
    end
    # Double the value
    double_numeric = elem(numeric_value, 0) * 2
    # If the value is greater than 9 add the digits and add to the sum
    if (double_numeric > 9) do
      remainder = rem double_numeric, 10
      findDoubleSum(str, pos - 1, sum + 1 + remainder)
    else
    # Otherwise, just add the doubled value.
      findDoubleSum(str, pos - 1, sum + double_numeric)
    end

  end

  def findDoubleSum(_str, _pos, sum) do
    sum
  end

  def multiplyAndModulo(value) do
    rem value * 9, 10
  end

end