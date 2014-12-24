class Complement
  def self.of_dna(strand)
    build_complement_for(strand, DNA)
  end

  def self.of_rna(strand)
    build_complement_for(strand, RNA)
  end

  def self.build_complement_for(strand, type)
    ret = ""
    strand.each_char { |x| ret << type.new(x).complement }
    ret
  end
end

class RNA
  attr_accessor :nucleotide

  def initialize(nucleotide)
    self.nucleotide = nucleotide
  end

  def complement
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
  attr_accessor :nucleotide

  def initialize(nucleotide)
    self.nucleotide = nucleotide
  end

  def complement
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
