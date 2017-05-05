# Section 3.4.2
# Tail Recursive approach, based on tail calls (when the last thing a function
# does is call another function)
# Elixir treats tail calls specially by performing tail-call optimization
# Instead of allocating memory, a goto/jump statement happens, and no additional memory
# is consumed.
# This approach is preferable when there is a potentially unlimited list
# But the declarative classical approach may be better in certain situations where that is not the case.
defmodule ListHelperTR do
  def sum(list) do
    do_sum(0, list)
  end

  defp do_sum(current_sum, []) do
    current_sum
  end

  defp do_sum(current_sum, [head | tail]) do
    do_sum(head + current_sum, tail)
  end

  # Alternative versions of the same function:
  # defp do_sum(current_sum, [head | tail]) do
  #   new_sum = head + current_sum
  #   do_sum(new_sum, tail)
  # end
  #
  # defp do_sum(current_sum, [head | tail]) do
  #   head + current_sum
  #   |> do_sum(tail)
  # end
end
