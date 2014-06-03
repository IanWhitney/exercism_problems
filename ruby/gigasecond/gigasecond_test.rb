require 'minitest/autorun'
require 'date'
require 'time'
require_relative 'gigasecond'

class GigasecondTest < MiniTest::Unit::TestCase

  def test_1
    1000.times do |x|
      random_date = Time.at(rand * Time.now.to_i).to_date
      expected = random_date + 11574

      gs = Gigasecond.new(random_date)
      assert_equal expected, gs.date
      assert_equal expected, random_date.gigaseconds_since(1)
    end
  end
end
