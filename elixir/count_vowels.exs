require IEx

defmodule Vowels do
  def count(string) do
    list = String.to_char_list(string)

    Enum.count(list, fn(x) ->
      is_vowel(x)
    end)
  end

  defp is_vowel(char) do
    cond do
      char == 97 -> true  # a
      char == 101 -> true # e
      char == 105 -> true # i
      char == 111 -> true # o
      char == 117 -> true # u
      true -> false
    end
  end

end

IO.puts "Enter a string to count vowels"

val = IO.gets "> "

IO.puts Vowels.count val