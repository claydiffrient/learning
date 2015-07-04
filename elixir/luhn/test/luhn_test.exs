defmodule LuhnTest do
  use ExUnit.Case

  test "finds the proper sum of all digits" do
    account_number = "79927398713"
    val = Luhn.findDoubleSum(account_number, String.length(account_number), 0)
    assert(val == 67, "has proper sum value")
  end
end
