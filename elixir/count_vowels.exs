require IEx

defmodule Vowels do
  def count(string) do
    list = String.to_char_list(string)

    Enum.reduce(list, fn(x, acc) ->
      if is_vowel(x) do
        acc + 1
      end
    end
    )

  end

  def from_code_point(<< code_point :: size(32) >>) do
    "x{#{code_point}}"
  end

  defp is_vowel(char) do

    IEx.pry
    cond do
      char == 'a' -> true
      char == 'e' -> true
      char == 'i' -> true
      char == 'o' -> true
      char == 'u' -> true
      true -> false
    end
  end

end

IO.puts "Enter a string to count vowels"

val = IO.gets "> "

IO.puts Vowels.count val