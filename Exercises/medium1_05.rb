items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*all_but_last, last_one|
  puts all_but_last.join(', ')
  puts last_one
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first_one, *middle_ones, last_one|
  puts first_one
  puts middle_ones.join(', ')
  puts last_one
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first_one, *all_but_first|
  puts first_one
  puts all_but_first.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |first_one, second_one, third_one, fourth_one|
  puts "#{first_one}, #{second_one}, #{third_one}, and #{fourth_one}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
