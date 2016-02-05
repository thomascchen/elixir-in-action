defmodule MyModule do
  import IO

  def my_function do
    puts "Calling imported function."
  end
end

defmodule AliasModule do
  alias IO, as: MyIO

  def my_function do
    MyIO.puts("Calling imported function.")
  end
end
