class Complement
  def self.of_dna(strand)
    DNA.new(strand).to_rna
  end

  def self.of_rna(strand)
    RNA.new(strand).to_dna
  end
end

class NucleicAcid
  attr_accessor :strand

  def initialize(strand)
    self.strand = strand
  end

  def nucleotides
    strand.chars
  end

  def to_dna
    raise StandardError, "Call this on descendants"
  end

  def to_rna
    raise StandardError, "Call this on descendants"
  end

  def self.complement_for(nucleotide)
    raise StandardError, "Call this on descendants"
  end
end

class RNA < NucleicAcid
  def self.complement_for(nucleotide)
    {"C" => "G", "G" => "C", "T" => "A", "A" => "U"}[nucleotide]
  end

  def to_dna
    nucleotides.inject("") do |ret, nucleotide|
      ret << DNA.complement_for(nucleotide)
    end
  end

  def to_rna
    self
  end
end

class DNA < NucleicAcid
  def self.complement_for(nucleotide)
    {"C" => "G", "G" => "C", "U" => "A", "A" => "T"}[nucleotide]
  end

  def to_rna
    nucleotides.inject("") do |ret, nucleotide|
      ret << RNA.complement_for(nucleotide)
    end
  end

  def to_dna
    self
  end
end
