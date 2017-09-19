require 'pry'

class Bst
  attr_reader :data, :left, :right

  def initialize(num)
    @data = num
    @left = nil
    @right = nil
  end

  def insert(num)
    node = num <= data ? left : right
    if node.nil?
      create_child_node(Bst.new(num))
    else
      node.insert(num)
    end
  end

  def each
    return to_enum if !block_given?
    arr = []
    arr += left.each { |data| yield(data) } unless left.nil?
    yield(data)
    arr << data
    arr += right.each { |data| yield(data) } unless right.nil?
    arr
  end

  private

  def create_child_node(node)
    @left = node if node.data <= data
    @right = node if node.data > data
  end
end
