require 'delegate'
class Gigasecond < SimpleDelegator
  def date
    __getobj__ + 11574 #number of days in a gigasecond
  end
end
