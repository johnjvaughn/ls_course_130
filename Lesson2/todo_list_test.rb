require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos[1..2], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todos[0..1], @list.to_a)
  end

  def test_done_question
    refute(@list.done?)
    @list.mark_all_done
    assert(@list.done?)
  end

  def test_raises_type_error
    assert_raises(TypeError) { @list.add("not a todo item") }
  end

  def test_shovel_operator_works
    todo = Todo.new("Test Task")
    @list << todo
    @todos << todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias_method
    todo = Todo.new("Test Task")
    list2 = @list.clone
    @list.add(todo)
    list2 << todo
    assert_equal(list2.to_a, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    refute(@todo1.done?)
    @list.mark_done_at(0)
    assert(@todo1.done?)
    refute(@list.done?)
    assert_raises(IndexError) { @list.mark_done_at(5) }
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    assert(@todo1.done?)
    @list.mark_undone_at(0)
    refute(@todo1.done?)
    refute(@list.item_at(0).done?)
    assert_raises(IndexError) { @list.mark_undone_at(15) }
  end

  def test_mark_done
    @list.mark_done("Clean room")
    assert(@todo2.done?)
    refute(@todo1.done?)
    refute(@todo3.done?)
  end

  def test_mark_all_done
    @list.mark_done_at(2)
    refute(@list.done?)
    @list.done!
    assert(@list.done?)
    assert(@todos.all? { |todo| todo.done? })
  end

  def test_mark_all_undone
    @list.mark_all_done
    assert(@list.done?)
    @list.mark_all_undone
    refute(@list.done?)
    assert_equal([], @list.all_done.to_a)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(4) }
    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_find_by_title
    assert_equal(@todo3, @list.find_by_title("Go to gym"))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @list.mark_done_at(1)
    assert_equal([@todo2], @list.all_done.to_a)
  end
  
  def test_all_not_done
    assert_equal(@todos, @list.all_not_done.to_a)
    @list.mark_done_at(0)
    assert_equal([@todo2, @todo3], @list.all_not_done.to_a)
  end
  
  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
    @list.mark_done_at(0)
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
    @list.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    collection = []
    return_val = @list.each { |todo| collection << todo }
    assert_equal(@todos, collection)
    assert_equal(@list, return_val)
  end
  
  def test_select
    list2 = TodoList.new("Today's Todos")
    list2.add(@todo1)
    selection = @list.select { |todo| todo.title[0] == 'B' }
    assert_equal(list2.to_a, selection.to_a)
  end

end
