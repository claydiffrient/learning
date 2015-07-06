defmodule FactorialTest do
  use ExUnit.Case

  test "0! == 1" do
    assert Factorial.calculate(0) == 1
  end

  test "10! == 3628800" do
    assert Factorial.calculate(10) == 3628800
  end
end
