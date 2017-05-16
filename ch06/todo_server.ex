defmodule TodoServer do
  use GenServer

  def start do
    GenServer.start(TodoServer, nil)
  end

  def add_entry(todo_server, new_entry) do
    GenServer.cast(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server, date) do
    GenServer.call(todo_server, {:entries, date})
  end


  def init(_) do
    {:ok, TodoList.new}
  end

  def handle_cast({:add_entry, new_entry}, todo_list) do
    new_state = TodoList.add_entry(todo_list, new_entry)
    {:noreply, new_state}
  end

  def handle_call({:entries, date}, _, todo_list) do
    {
      :reply,
      TodoList.entries(todo_list, date),
      todo_list
    }
  end
end



defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      # fn(entry, todo_list_acc) ->
      #   add_entry(todo_list_acc, entry)
      # end
      &add_entry(&2, &1)
    )
  end

  # Bonus runtime type checks via pattern matching on TodoList struct
  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list,
    entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)

    %TodoList{todo_list |
      entries: new_entries,
      auto_id: auto_id + 1
    }
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn({_, entry}) ->
        entry.date == date
      end)
    |> Enum.map(fn({_, entry}) ->
        entry
      end)
  end

  # Alternative interface for update_entry
  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn(_) -> new_entry end)
  end

  def update_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id,
    updater_fun
  ) do
    case entries[entry_id] do
      nil -> todo_list

      old_entry ->
        old_entry_id = old_entry.id
        new_entry = %{id: ^old_entry_id} = updater_fun.(old_entry) # Nested match requires the result of this function to be a Map and that the id matches the old entry id
        new_entries = Map.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries }
    end
  end

  def delete_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id
  ) do
    case entries[entry_id] do
      nil -> todo_list

      _ ->
        new_entries = Map.delete(entries, entry_id)
        %TodoList{todo_list | entries: new_entries }
    end
  end

  def test_entries do
    [
      %{date: {2013, 12, 19}, title: "Dentist"},
      %{date: {2013, 12, 20}, title: "Shopping"},
      %{date: {2013, 12, 21}, title: "Movies"},
    ]
  end
end
