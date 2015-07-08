require List

defmodule PrimeFactors do
  def getPrimeFactors(val, factors \\ []) do
    if (rem(val, 2) == 0) do
      getPrimeFactors(div(val, 2), List.insert_at(factors, 0, 2))
    else
      factors ++ findOdds(val, 3)
    end
  end

  defp findOdds(val, count, factors \\ []) do
    IO.puts rem(val, count)
    IO.puts count <= :math.sqrt(val)
    if (count <= :math.sqrt(val)) do
      if (rem(val, count) == 0) do
        findOdds(div(val, count), count + 2, List.insert_at(factors, 0, count))
      end
    else
      List.insert_at(factors, 0, val)
    end

  end
end
