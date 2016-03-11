defmodule LinesLengths do
  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.length(&1))
    |> Enum.to_list
  end
end
