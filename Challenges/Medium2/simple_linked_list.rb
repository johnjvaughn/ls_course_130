class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def pop
    datum = peek
    @head = head.next
    datum
  end

  def peek
    head&.datum
  end

  def size
    to_a.size
  end

  def empty?
    head.nil?
  end

  def to_a
    arr = []
    element = head
    while !element.nil?
      arr << element.datum
      element = element.next
    end
    arr
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  def self.from_a(arr)
    list = new
    arr.reverse.each { |datum| list.push(datum) } unless arr.nil?
    list
  end
end
