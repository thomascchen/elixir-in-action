defmodule NaturalNums do
  def print(1), do: IO.puts(1)

  def print(0), do: IO.puts("no natural numbers")

  def print(n) when n < 0 do
    n
    |> abs
    |> print
  end

  def print(n) when is_float(n) do
    n
    |> round
    |> print
  end

  def print(n) when n > 1 do
    print(n-1)
    IO.puts(n)
  end
end
