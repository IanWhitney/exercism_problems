class Hamming
  def self.compute(a,b)
    a = Strand.parse(a)
    b = Strand.parse(b)
    main = (a.count < b.count) ? [a,b] : [b,a]
    y = main[0].zip(main[1])
    y.inject(0) {|ret, h| ret += 1 if h.first != h.last; ret}
  end
end

class Strand
  include Enumerable

  attr_accessor :collection

  def self.parse(strand_string)
    self.new(strand_string)
  end

  def initialize(strand_string)
    self.collection = strand_string.split(//)
  end

  def each(&block)
    collection.each(&block)
  end
end
