defmodule TodoList.CsvImporter do
  def import(file) do
    File.stream!(file)
    |> Stream.map(fn(x) ->
      split_string = String.replace(x, "\n", "")
        |> String.split(",")

      {datetime, title} = split_string |> List.to_tuple

      {year, month, date} = String.split(datetime, "/")
        |> Enum.map(fn(y) -> String.to_integer(y) end)
        |> List.to_tuple

      %TodoEntry{date: {year, month, date}, title: title}
    end)
  end
end
