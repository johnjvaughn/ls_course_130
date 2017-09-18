def max_by(arr)
  max_item = nil
  max_yield = nil
  arr.each do |item|
    result = yield(item)
    return item if [nil, false, true].include?(result)
    if max_yield.nil? || (result != max_yield && result > max_yield)
      max_yield = result
      max_item = item
    end
  end
  max_item
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
p max_by([-1, 1]) { |value| value**2 }
p [-1, 1].max_by { |value| value**2 }
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| nil }
p [1, 2, 3, 4].max_by { |value| (1..10) }
p max_by([1, 2, 3, 4]) { |value| (1..10) }
