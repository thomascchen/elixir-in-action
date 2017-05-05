defmodule Range do
  def range(from, to) do
    count(from, to)
  end

  defp count(from, from) do
    IO.puts(from)
  end

  defp count(from, to) do
    IO.puts(from)
    count(from + 1, to)
  end
end
