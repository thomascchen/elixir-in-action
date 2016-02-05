defmodule Pipeline do
  def pipeline(n) do
    n
    |> abs
    |> Integer.to_string
    |> IO.puts
  end
end
