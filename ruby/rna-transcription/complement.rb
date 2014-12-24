class Complement
  def self.of_dna(strand)
    DNA.new(strand).to_rna
  end

  def self.of_rna(strand)
    RNA.new(strand).to_dna
  end
end

class RNA
  attr_accessor :strand

  def self.complement_for(nucleotide)
    {"C" => "G", "G" => "C", "T" => "A", "A" => "U"}[nucleotide]
  end

  def initialize(strand)
    self.strand = strand
  end

  def nucleotides
    strand.chars
  end

  def to_dna
    nucleotides.inject("") do |ret, nucleotide|
      ret << DNA.complement_for(nucleotide)
    end
  end

end

class DNA
  attr_accessor :strand

  def self.complement_for(nucleotide)
    {"C" => "G", "G" => "C", "U" => "A", "A" => "T"}[nucleotide]
  end

  def initialize(strand)
    self.strand = strand
  end

  def nucleotides
    strand.chars
  end

  def to_rna
    nucleotides.inject("") do |ret, nucleotide|
      ret << RNA.complement_for(nucleotide)
    end
  end
end
