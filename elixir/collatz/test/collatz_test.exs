defmodule CollatzTest do
  use ExUnit.Case

  test "when 2 is input steps == 1" do
    assert Collatz.calculate(2) == 1
  end

  test "when 16 is input steps == 4" do
    assert Collatz.calculate(16) == 4
  end

  test "when 5 is input steps == 5" do
    assert Collatz.calculate(5) == 5
  end

  test "when 7 is input steps == 16" do
    assert Collatz.calculate(7) == 16
  end

end
