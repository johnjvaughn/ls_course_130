class WordProblem
  OPERATIONS = { 'multiplied' => '*', 'divided' => '/', 'plus' => '+', 'minus' => '-' }

  def initialize(phrase)
    @words = phrase.downcase.gsub(/\?/, '').split
  end

  def answer
   register = nil
    op = nil
    @words.each do |word|
      if OPERATIONS.key?(word) && !register.nil?
        op = OPERATIONS[word]
      elsif word.to_i != 0 || word == '0'
        if register.nil?
          register = word.to_i
        elsif !op.nil?
          register = register.send(op, word.to_i)
        end
      end
    end
    raise ArgumentError if register.nil? || op.nil?
    register
  end
end

p WordProblem.new('What is 53 plus 2?').answer
