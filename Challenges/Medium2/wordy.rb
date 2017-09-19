class WordProblem
  OPERATIONS = { 'multiplied' => '*', 'divided' => '/',
                 'plus' => '+', 'minus' => '-' }

  def initialize(phrase)
    @words = phrase.downcase.delete('?').split
  end

  def answer
    register = nil
    op = nil
    @words.each do |word|
      if OPERATIONS.key?(word) && !register.nil?
        op = OPERATIONS[word]
      else
        register = assign_register(word, register, op)
      end
    end
    raise ArgumentError if register.nil? || op.nil?
    register
  end

  private

  def assign_register(word, register, op)
    return register if word.to_i == 0 && word != 0
    return word.to_i if register.nil?
    return register.send(op, word.to_i) if !op.nil?
    register
  end
end

p WordProblem.new('What is 53 plus 2?').answer
