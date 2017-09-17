def missing(arr)
  (arr.first...arr.last).reject { |num| arr.include?(num) }
end

def missing2(arr)
  saved_nums = []
  index = 0
  while index < arr.size
    if (index > 0) && (arr[index] > arr[index - 1] + 1)
      saved_nums += ((arr[index - 1] + 1)...arr[index]).to_a
    end
    index += 1
  end
  saved_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []
