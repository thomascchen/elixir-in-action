defmodule ListLength do
  def count(list) when is_list(list) do
    counter(0, list)
  end

  def count(_) do
    IO.puts("not a list!")
  end

  defp counter(accumulator, []) do
    accumulator
  end

  defp counter(accumulator, [_ | tail]) do
    new_length = accumulator + 1
    counter(new_length, tail)
  end
end
