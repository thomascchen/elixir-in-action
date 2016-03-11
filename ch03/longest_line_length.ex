defmodule LongestLine do
  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.length(&1))
    |> Enum.sort
    |> List.last
  end
end
