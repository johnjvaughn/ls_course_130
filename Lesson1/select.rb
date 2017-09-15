def select(arr)
  selected_arr = []
  index = 0
  while index < arr.size
    selected_arr << arr[index] if yield(arr[index])
    index += 1
  end
  selected_arr
end

letters = %w(a b c d)
letters2 = select(letters) do |ltr|
  'ac'.include?(ltr)
end

p letters2