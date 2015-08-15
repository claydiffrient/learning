defmodule SieveTest do
  use ExUnit.Case

  test "generates a list from 2 until the given number" do
    list = Sieve.generate_list 100
    assert Enum.count(list) == 100
  end

  test "removes all even numbers other than 2" do
    list = Sieve.generate_list 100
    IO.inspect Sieve.remove_composites(list)
  end
end
