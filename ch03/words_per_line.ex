defmodule WordsPerLine do
  def words_per_line!(path) do
    File.stream!(path)
    |> Enum.map(fn(x) -> length(String.split(x)) end)
  end
end
