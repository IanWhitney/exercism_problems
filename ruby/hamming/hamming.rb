class Hamming
  def self.compute(a,b)
    a = Strand.parse(a)
    b = Strand.parse(b)
    y = self.combine(self.sort(a,b))
    y.inject(0) {|ret, h| ret += 1 if h.first != h.last; ret}
  end

  private

  def self.combine(sorted_strands)
    sorted_strands[0].zip(sorted_strands[1])
  end

  def self.sort(strand_one, strand_two)
    [strand_one,strand_two].sort_by { |strand| strand.length }
  end
end

class Strand
  include Enumerable

  def self.parse(strand_string)
    self.new(strand_string)
  end

  def initialize(strand_string)
    self.collection = strand_string.split(//)
  end

  def each(&block)
    collection.each(&block)
  end

  def length
    collection.count
  end

  private

  attr_accessor :collection
end
