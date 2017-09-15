def each(arr)
  index = 0
  while index < arr.size
    yield(arr[index])
    index += 1
  end
  arr
end

letters = %w(a b c d)
letters2 = each(letters) do |ltr|
  puts ltr.upcase
end

p letters2