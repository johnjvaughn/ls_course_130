class House
  def self.recite
    new.recite
  end

  def recite_one_verse(start_line)
    pieces_arr = pieces
    output = "This is "
    (start_line...pieces_arr.size).each do |index|
      output += pieces_arr[index].first
      output += if pieces_arr[index].size > 1
                  "\n#{pieces_arr[index].last} "
                else
                  ".\n"
                end
    end
    output
  end

  def recite
    (pieces.size - 1).downto(0)
                     .map { |start_line| recite_one_verse(start_line) }
                     .join("\n")
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

print House.recite
