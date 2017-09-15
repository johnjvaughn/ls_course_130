class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.instance_of?(Todo)
    @todos << todo
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(index)
  end

  def to_s
    @todos.reduce("---- #{title} ----\n") do |str, todo|
      str << todo.to_s + "\n"
    end
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
p list.add(todo1)                 # adds todo1 to end of list, returns list
p list.add(todo2)                 # adds todo2 to end of list, returns list
p list.add(todo3)                 # adds todo3 to end of list, returns list
puts "#{list}"
begin
  list.add(1)                     # raises TypeError with message "Can only add Todo objects"
rescue TypeError
  p "Correctly raised TypeError"
end

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
begin
  list.item_at                    # raises ArgumentError
rescue ArgumentError
  p "Correctly raised ArgumentError"
end
p list.item_at(1)                 # returns 2nd item in list (zero based index)
begin
  p list.item_at(100)               # raises IndexError
rescue IndexError
  p "Correctly raised IndexError"
end

# ---- Marking items in the list -----

# mark_done_at
begin
  list.mark_done_at               # raises ArgumentError
rescue ArgumentError
  p "Correctly raised ArgumentError"
end
p list.mark_done_at(1)            # marks the 2nd item as done
begin
  list.mark_done_at(100)          # raises IndexError
rescue IndexError
  p "Correctly raised IndexError"
end

# mark_undone_at
begin
  list.mark_undone_at             # raises ArgumentError
rescue ArgumentError
  p "Correctly raised ArgumentError"
end
list.mark_undone_at(1)          # marks the 2nd item as not done,
begin
  list.mark_undone_at(100)        # raises IndexError
rescue IndexError
  p "Correctly raised IndexError"
end

# ---- Deleting from the the list -----

# shift
p list.shift                      # removes and returns the first item in list

# pop
p list.pop                        # removes and returns the last item in list

# remove_at
begin
  list.remove_at                  # raises ArgumentError
rescue ArgumentError
  p "Correctly raised ArgumentError"
end
list.remove_at(1)               # removes and returns the 2nd item
begin
  list.remove_at(100)             # raises IndexError
rescue IndexError
  p "Correctly raised IndexError"
end

# ---- Outputting the list -----

# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
