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
  alias add <<

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

  def done?
    @todos.all?(&:done?)
  end

  def remove_at(index)
    #@todos.delete_at(index)
    @todos.delete(item_at(index))
  end

  def find_by_title(title)
    each { |todo| return todo if todo.title == title }
    nil
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    (todo = find_by_title(title)) && todo.done!
  end

  def mark_all_done
    each(&:done!)
  end
  alias done! mark_all_done

  def mark_all_undone
    each(&:undone!)
  end

  def to_a
    @todos
  end

  def to_s
    @todos.reduce("---- #{title} ----\n") do |str, todo|
      str << todo.to_s + "\n"
    end
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |todo| new_list.add(todo) if yield(todo) }
    new_list
  end
end
