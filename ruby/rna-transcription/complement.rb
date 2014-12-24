class Complement
  def self.of_dna(strand)
    DNA.new(strand).complement
  end

  def self.of_rna(strand)
    RNA.new(strand).complement
  end
end

class RNA
  attr_accessor :strand

  def initialize(strand)
    self.strand = strand
  end

  def nucleotides
    strand.chars
  end

  def complement
    nucleotides.inject("") do |ret, nucleotide|
      ret << complement_of(nucleotide)
    end
  end

  def complement_of(nucleotide)
    case nucleotide
    when 'C'
      'G'
    when 'G'
      'C'
    when 'U'
      'A'
    when 'A'
      'T'
    end
  end
end

class DNA
  attr_accessor :strand

  def initialize(strand)
    self.strand = strand
  end

  def nucleotides
    strand.chars
  end

  def complement
    nucleotides.inject("") do |ret, nucleotide|
      ret << complement_of(nucleotide)
    end
  end

  def complement_of(nucleotide)
    case nucleotide
    when 'C'
      'G'
    when 'G'
      'C'
    when 'T'
      'A'
    when 'A'
      'U'
    end
  end
end
