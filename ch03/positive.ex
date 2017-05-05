defmodule PositiveNum do
  def filter(list) do
    eval_list([], list)
  end

  defp eval_list(new_list, []) do
    new_list
  end

  defp eval_list(new_list, [head | tail]) when is_number(head) and head > 0 do
    positive_list = new_list ++ [head]
    eval_list(positive_list, tail)
  end

  defp eval_list(new_list, [_ | tail]) do
    eval_list(new_list, tail)
  end
end
