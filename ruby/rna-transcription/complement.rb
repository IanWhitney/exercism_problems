class Complement
  def self.of_dna(strand)
    build_complement_for(strand, "dna")
  end

  def self.of_rna(strand)
    build_complement_for(strand, "rna")
  end

  def self.build_complement_for(strand, type)
    ret = ""
    strand.each_char { |x| ret << public_send("find_#{type}_complement_of".to_sym, x) }
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
