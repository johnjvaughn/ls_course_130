def step(start_num, end_num, step)
  (start_num..end_num).select do |num|
    yield(num) if (num - start_num) % step == 0
  end
  nil
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
