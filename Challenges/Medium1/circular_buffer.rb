class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = [nil] * size
    @pointer = 0
  end

  def read
    read_pointer = @pointer
    while self[read_pointer].nil?
      read_pointer = advance_pointer(read_pointer)
      raise BufferEmptyException, "Attempt to read from an empty buffer" \
        if read_pointer == @pointer
    end
    value = self[read_pointer]
    self[read_pointer] = nil
    value
  end

  def write(element)
    return write!(element) if self[@pointer].nil?
    raise BufferFullException, "Attempt to write to a full buffer"
  end

  def write!(element)
    return if element.nil?
    self[@pointer] = element
    @pointer = advance_pointer(@pointer)
  end

  def clear
    @buffer.map! { nil }
  end

  def [](index)
    @buffer[index]
  end

  def []=(index, element)
    @buffer[index] = element
  end

  def to_s
    @buffer.join(' | ')
  end

  private

  def advance_pointer(pos)
    (pos + 1) % @buffer.size
  end
end

# buffer = CircularBuffer.new(3)
# buffer.write('A')
# buffer.write('b')
# buffer.write('c')
# buffer.write('D')
# puts buffer
# puts "Read #{buffer.read} from buffer"
# puts buffer
# puts "Read #{buffer.read} from buffer"
# puts buffer
