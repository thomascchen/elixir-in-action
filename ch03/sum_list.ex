# Section 3.4.1
# Recursive approach could potentially lead to running out of memory with
# a very long list because each time sum is called, new memory is allocated
# or pushed onto the stack without releasing or popping until the recursion
# has completed.
defmodule ListHelper do
  def sum([]), do: 0
  def sum([head | tail]) do
    head + sum(tail)
  end
end
