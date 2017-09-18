fact = Enumerator.new do |yielder|
  accumulator = 1
  index = 0
  loop do
    yielder << accumulator
    index += 1
    accumulator *= index
  end
end

7.times { puts fact.next }
fact.rewind

fact.each_with_index do |num, index|
  puts num
  break if index >= 6
end
