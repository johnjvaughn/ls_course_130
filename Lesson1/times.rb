def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
end

times(5) do |n|
  puts n
end

arr = []
times(5) { |n| arr << n**2 }
p arr