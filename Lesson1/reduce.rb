def reduce(arr, start = 0)
  accum = start
  index = 0
  while index < arr.size
    accum = yield(accum, arr[index])
    index += 1
  end
  accum
end

num_arr = (1..10).to_a
p reduce(num_arr) { |acc, num| acc + (num.even? ? num : 0) }
p reduce(num_arr, 1) { |acc, num| acc * num }

array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
begin
  reduce(array) { |acc, num| acc + num if num.odd? } 
rescue NoMethodError
  p "NoMethodError - improper block for reduce method"
end