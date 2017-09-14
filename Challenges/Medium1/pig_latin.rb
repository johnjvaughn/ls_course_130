class PigLatin
  VOWELS = 'aeiou'
  SUFFIX = 'ay'
  DONT_MOVE_CONSONANTS = %w(xr yt)

  def self.translate_word(word)
    # filter input?
    new_word = word.clone
    if !DONT_MOVE_CONSONANTS.include?(new_word[0..1])
      new_word.sub!(/^([^#{VOWELS}]+)/, '')
      new_word << $1 if $1
    end
    # check for qu special case, move the u to stay with the q
    if new_word[-1] == 'q' && new_word[0] == 'u'
      new_word = new_word[1..-1] + new_word[0]
    end
    new_word << SUFFIX
  end

  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end
end

p PigLatin.translate("chair")
p PigLatin.translate("airplane")
mot = "queen"
p PigLatin.translate(mot)
p mot
