defmodule PrimeFactorsTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "20" do
    assert PrimeFactors.getPrimeFactors(20) == [2,2,5]
  end

  test "135" do
    assert PrimeFactors.getPrimeFactors(20) == [3,3,5,7]
  end
end
