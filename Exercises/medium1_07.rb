# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

puts "A return call within a proc that is defined and invoked within a method, returns out of the method."

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

begin
  check_return_with_proc_2(my_proc)
rescue LocalJumpError
  puts "A proc defined outside a method that contains a return, if invoked within the method will generate a LocalJumpError."
end

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda2(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda2(my_lambda)

puts "In lambdas, a return statement is interpreted local to the invocation only, whether the lambda \
was defined within our outside the method."

# Group 5
def block_method_3
  yield
end

block_method_3 { return }
