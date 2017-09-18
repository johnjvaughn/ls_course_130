# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call(nil)
puts "Lambdas demand the specified number of arguments."
my_third_lambda = Proc.new &lambda { |thing| puts "This is a #{thing}" }
puts "There's no Ruby class called Lambda.  Use lambda {} or Proc.new &lambda {}."

# Group 3
def block_method_1(animal)
  yield if block_given?
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
puts "Block arguments not passed from yield will be automatically filled with nil values."
block_method_2('turtle') { }#puts "This is a #{animal}."}
puts "A block that doesn't include the arguments can run but any references to the arguments will generate a NameError."
