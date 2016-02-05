defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end

  def square_area(a) do
    rectangle_area(a, a)
  end
end

defmodule GeometryCondensed do
  def rectangle_area(a, b), do: a * b

  def circle_area(r), do: 3.14 * r * r
end
