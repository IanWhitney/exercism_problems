class Hamming
  def self.compute(a,b)
    HammingDifference.new(Strand.parse(a), Strand.parse(b)).count
  end
end

class HammingDifference
  def initialize(obj1, obj2)
    self.collection = obj1.zip(obj2).select {|strand_set| Comparison.different?(strand_set)}
  end

  def count
    collection.count
  end

  class Comparison
    def self.different?(couple)
      couple.first != couple.last &&
      !couple.last.nil? &&
      !couple.first.nil?
    end
  end

  private
  attr_accessor :collection
end


require 'delegate'
class Strand < SimpleDelegator
  def self.parse(strand_string)
    self.new(strand_string.split(//))
  end
end
