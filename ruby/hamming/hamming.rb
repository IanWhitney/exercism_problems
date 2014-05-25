class Hamming
  def self.compute(a,b)
    y = Strands.new(
      Strand.parse(a),
      Strand.parse(b)
    ).sort.combine
    y.inject(0) {|ret, h| ret += 1 if h.first != h.last; ret}
  end
end

class Strands
  include Enumerable

  def initialize(*strands)
    self.collection = strands
  end

  def each(&block)
    collection.each(&block)
  end

  def combine
    collection[0].zip(collection[1])
  end

  def sort
    collection.sort_by! { |strand| strand.length }
    self
  end

  private

  attr_accessor :collection
end

class Strand
  include Enumerable

  def self.parse(strand_string)
    self.new(strand_string.split(//))
  end

  def initialize(strand_string)
    self.collection = Array(strand_string)
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
