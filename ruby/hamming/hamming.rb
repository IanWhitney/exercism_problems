class Hamming
  def self.compute(a,b)
    (Strand.parse(a) - Strand.parse(b)).count
  end
end

module Hammable
  def -(other)
    sorted = [self,other].sort_by { |x| x.count }
    combined = sorted.first.zip(sorted.last)
    x = combined.select {|strand_set| strand_set.first != strand_set.last}
    self.class.new(x)
  end
end

require 'delegate'

class Strand < SimpleDelegator
  include Hammable

  def self.parse(strand_string)
    self.new(strand_string.split(//))
  end
end
