class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    length = [@strand.length, other_strand.length].min
    (0...length).sum do |index|
      @strand[index] != other_strand[index] ? 1 : 0
    end
  end
end

dna1 = DNA.new('ACTG')
p dna1.hamming_distance('ATCG')