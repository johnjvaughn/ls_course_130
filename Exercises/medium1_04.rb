def assign_vars(arr)
  yield(arr)  
end

birds = []
assign_vars(%w(raven finch hawk eagle)) { |_, _, *raptors| birds = raptors }
p birds
