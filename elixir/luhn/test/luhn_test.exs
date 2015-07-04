defmodule LuhnTest do
  use ExUnit.Case

  test "finds the proper sum of all digits" do
    account_number = "79927398713"
    val = Luhn.findDoubleSum(account_number, String.length(account_number), 0)
    assert(val == 67, "has proper sum value")
  end

  test "finds the proper checksum digit given a value" do
    val = 67
    digit = Luhn.multiplyAndModulo(val)
    assert(digit == 3, "finds proper checksum digit")
  end

  test "verifies that the account number is valid" do
    account_number = "79927398713"
    is_valid = Luhn.verify account_number
    assert(is_valid, "account is valid")
  end

  test "verifies that invalid accounts are invalid" do
    account_number = "79932313135"
    is_valid = Luhn.verify account_number
    assert(!is_valid, "account is invalid")
  end
end
