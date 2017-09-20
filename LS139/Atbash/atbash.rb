class Atbash
  ALPHABET = ('a'..'z').to_a.join.freeze

  def self.encode(str)
    str.downcase
       .gsub(/\W/, '')
       .tr(ALPHABET, ALPHABET.reverse)
       .scan(/.{1,5}/)
       .join(' ')
  end
end
