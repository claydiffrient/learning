defmodule Sieve do

  def sieve(max_num) do
    generate_list(max_num)
  end

  def generate_list(2, list) do
    list
  end

  def generate_list(max_num, list \\ []) do
    new_list = List.insert_at(list, -1, max_num - 1)
    generate_list(max_num - 1, new_list)
  end



end
