class RunLengthEncoding
  def self.encode(str)
    return '' if str.empty?
    run_info = str.partition(/^#{str[0]}+/)
    run_length = run_info[1].size > 1 ? run_info[1].size : ''
    coded_run = "#{run_length}#{run_info[1][0]}"
    return coded_run if run_info[2].empty?
    coded_run + encode(run_info[2])
  end

  def self.decode(coded_str)
    return '' if coded_str.empty?
    run_info = coded_str.partition(/\D/)
    run_length = run_info[0].empty? ? 1 : run_info[0].to_i
    decoded_run = run_info[1] * run_length
    return decoded_run if run_info[2].empty?
    decoded_run + decode(run_info[2])
  end
end

input = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
output = '12WB12W3B24WB'
p RunLengthEncoding.encode(input) == output
p RunLengthEncoding.decode(output) == input
