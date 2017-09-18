def each_with_index(arr)
  (1...arr.size).each { |index| yield(arr[index], index) }
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
