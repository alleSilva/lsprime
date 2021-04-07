defmodule Lsprime.CLI do
  def main(args) do
    {_, [arg], _} =
    args
    |> OptionParser.parse(strict: [])
    value = String.to_integer(arg)
    result = is_prime(value)
    IO.inspect(result)
  end

  def is_prime(num) when num > 0, do: verify_rest(num, 1)

  defp verify_rest(n, n), do: "#{n} is prime"

  defp verify_rest(n, acc) do
    acc = acc + 1
    if acc < n && rem(n, acc) == 0 do
      "#{n} is not prime"
    else
      verify_rest(n, acc)
    end
  end
end
