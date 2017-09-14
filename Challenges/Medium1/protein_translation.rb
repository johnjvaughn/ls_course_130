class InvalidCodonError < StandardError; end

class Translation
  PROTEINS = { 
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    raise InvalidCodonError, "Invalid codon" unless PROTEINS.key?(codon)
    PROTEINS[codon]
  end

  def self.of_rna(strand)
    (0..(strand.length - 3)).step(3).each_with_object([]) do |index, trans|
      codon = of_codon(strand[index, 3])
      return trans if codon == 'STOP'
      trans << codon
    end
  end
end

strand = 'UGGUGUUAUUAAUGGUUU'
p Translation.of_rna(strand)

