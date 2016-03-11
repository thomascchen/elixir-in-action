defmodule LongestLine do
  def longest_line!(path) do
    File.stream!(path)
    |> Stream.map(fn(x) -> {String.length(x), x} end)
    |> Enum.sort
    |> List.last
    |> Kernel.elem(1)
  end
end
