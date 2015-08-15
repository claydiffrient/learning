defmodule SieveTest do
  use ExUnit.Case

  test "generates a list from 2 until the given number" do
    list = Sieve.generate_list 100
    assert Enum.count(list) == 98
  end
end
