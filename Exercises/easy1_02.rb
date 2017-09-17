def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

def compute2(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

p compute2(3) { |x| 5 * x + 3 } == 18
p compute2('z') { |str| 'a' + 'b' + str } == 'abz'
p compute2(:something) == 'Does not compute.'
