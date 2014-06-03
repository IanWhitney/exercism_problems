require 'minitest/autorun'
require 'date'
require 'time'
require_relative 'gigasecond'

class GigasecondTest < MiniTest::Unit::TestCase

  def test_1
    d = Date.new(2011, 4, 25)
    expected = d + 11574

    gs = Gigasecond.new(d)
    assert_equal expected, gs.date
    assert_equal expected, d.gigaseconds_since(1)
  end

  def test_2
    d = Date.new(1977, 6, 13)
    expected = d + 11574

    gs = Gigasecond.new(d)
    assert_equal expected, gs.date
    assert_equal expected, d.gigaseconds_since(1)
  end

  def test_3
    d = Date.new(1959, 7, 19)
    expected = d + 11574

    gs = Gigasecond.new(d)
    assert_equal expected, gs.date
    assert_equal expected, d.gigaseconds_since(1)
  end

  def test_yourself
    your_birthday = Date.new(2000, 1, 1)
    expected = your_birthday + 11574

    gs = Gigasecond.new(your_birthday)
    assert_equal expected, gs.date
    assert_equal expected, your_birthday.gigaseconds_since(1)
  end

end
