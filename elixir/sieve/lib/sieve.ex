defmodule Sieve do

  def sieve(max_num) do
    generate_list(max_num)
  end

  def generate_list(0, list) do
    list
  end

  def generate_list(max_num, list \\ []) do
    new_list = List.insert_at(list, -1, true)
    generate_list(max_num - 1, new_list)
  end

  def remove_composites(list, start_num \\ 2) do
    new_list = Stream.with_index(list) |>
    Stream.drop(2) |>
    Stream.map(fn (num) ->
      index = elem(num, 1)
      if (rem(index, start_num) == 0) do
        {false, index}
      else
        num
      end
    end) |>
    Stream.map(fn (num) ->
      elem(num, 0)
    end) |>
    Enum.to_list

    IO.puts start_num
    if (start_num < Enum.count(list)) do
      remove_composites(new_list, start_num + 1)
    else
      Stream.with_index(new_list) |>
      Stream.map(fn (num) ->
        elem(num, 1)
      end) |>
      Enum.to_list
    end

  end



end
