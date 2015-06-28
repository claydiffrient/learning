defmodule TempConvert do
  def celsius_to_farenheit(c_temp) do
    # Had to parse the value from a string to a float,
    # this however returns a tuple of which the first element
    # is the actual float, elem/2 allows me to get that first value.
    (9 / 5) * elem(Float.parse(c_temp), 0) + 32.0
  end
end

IO.puts "Enter a temperature in Farenheit to convert to Celsius"

val = IO.gets "> "

IO.puts TempConvert.celsius_to_farenheit val
