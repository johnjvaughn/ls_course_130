items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  #puts "#{items.join(', ')}"
  yield(items)
  puts "Let's stop gathering food."
end

gather(items) { puts "#{items.join(' - ')}" }

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
