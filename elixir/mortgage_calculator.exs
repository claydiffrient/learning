defmodule Mortgage do
  def calculate(loan_amount, interest_rate, loan_term) do
    numerator = interest_rate * :math.pow((1 + interest_rate), loan_term)
    denominator = :math.pow(1 + interest_rate, loan_term) - 1
    loan_amount * (numerator / denominator)
  end
end

IO.puts "Calculate monthly payments for a mortgage"

loan_amount = elem(Float.parse(IO.gets "Total Loan Amount > "), 0)
interest_rate = elem(Float.parse(IO.gets "Interest Rate > "), 0)
loan_term = elem(Integer.parse(IO.gets "Loan Term > "), 0)

IO.puts Mortgage.calculate loan_amount, interest_rate, loan_term
