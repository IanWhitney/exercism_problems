class Complement
  def self.of_dna(strand)
    ret = ""
    strand.each_char { |x| ret << find_dna_complement_of(x) }
    ret
  end

  def self.of_rna(strand)
    ret = ""
    strand.each_char { |x| ret << find_rna_complement_of(x) }
    ret
  end

  def self.find_dna_complement_of(nucleotide)
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

  def self.find_rna_complement_of(nucleotide)
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
