require 'minitest/autorun'
require 'minitest/mock'
require 'date'
require 'time'
require_relative 'gigasecond'

class GigasecondTest < MiniTest::Unit::TestCase
  def test_gigasecond_wraps_date_methods
    random_date = Minitest::Mock.new
    gs = Gigasecond.new(random_date)
    random_date.expect(:gigaseconds_since, 1) { true }
    gs.date
  end

  def test_date
    1000.times do |x|
      random_date = Time.at(rand * Time.now.to_i).to_date
      random_gigaseconds = rand(1000)
      expected = random_date + (10**9 * random_gigaseconds / (24 * 60 * 60))

      assert_equal expected, random_date.gigaseconds_since(random_gigaseconds), "Date: #{random_date} plus #{random_gigaseconds} gigaseconds should be #{expected} using gigaseconds_since"
    end
  end

  def test_datetime
    1000.times do |x|
      random_datetime = Time.at(rand * Time.now.to_i).to_datetime
      random_gigaseconds = rand(1000)
      expected = random_datetime + (10**9 * random_gigaseconds / (24 * 60 * 60))

      assert_equal expected, random_datetime.gigaseconds_since(random_gigaseconds), "DateTime: #{random_datetime} plus #{random_gigaseconds} gigaseconds should be #{expected} using gigaseconds_since"
    end
  end

  def test_time
    1000.times do |x|
      random_time = Time.at(rand * Time.now.to_i).to_time
      random_gigaseconds = rand(1000)
      expected = random_time + (10**9 * random_gigaseconds)

      assert_equal expected, random_time.gigaseconds_since(random_gigaseconds), "Time: #{random_time} plus #{random_gigaseconds} gigaseconds should be #{expected} using gigaseconds_since"
    end
  end
end
