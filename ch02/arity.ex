defmodule Rectangle do
  def area(a), do: area(a, a)

  def area(a, b), do: a * b
end

defmodule Calculator do
  def sum(a) do
    sum(a, 0)
  end

  def sum(a, b) do
    a + b
  end
end

defmodule CalculatorDefault do
  def sum(a, b \\ 0) do
    a + b
  end
end

defmodule MyModule do
  def fun(a, b \\ 1, c, d \\ 2) do
    a + b + c + d
  end
end
