require 'delegate'
class Gigasecond < SimpleDelegator
  def date
    __getobj__.gigaseconds_since(1)
  end
end

class DateTime
  def gigaseconds_since(multiple)
    self + multiple.gigaseconds
  end
end

class Date
  DAYS_PER_GIGASECOND = 11574
  def gigaseconds_since(multiple)
    self + (DAYS_PER_GIGASECOND * multiple)
  end
end

class Time
  def gigaseconds_since(multiple)
    self + multiple.gigaseconds
  end
end

class Numeric
  def gigaseconds
    self * 1_000_000_000
  end
  alias :gigasecond :gigaseconds
end
