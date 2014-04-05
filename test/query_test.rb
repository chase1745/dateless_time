require 'test_helper'

class QueryTest < Minitest::Test

  def setup
    @st_time = StaticTime.new [13, 37, 42]
  end



  def test_to_time_without_base
    @to_time = @st_time.to_time
    now = Time.now
    expected = Time.new(now.year, now.month, now.day, 13, 37, 42, now.utc_offset)

    assert_equal Time, @to_time.class
    assert_equal expected, @to_time
  end


  def test_to_time_with_base
    base = Time.new(1990, 11, 10, 12, 13, 14)
    @to_time = @st_time.to_time(base)
    
    assert_equal Time, @to_time.class
    assert_equal Time.new(1990, 11, 10, 13, 37, 42), @to_time
  end


  def test_to_s
    assert_equal "13:37:42", @st_time.to_s
  end


  def test_to_s_with_padding_zeroes
    @st_time = StaticTime.new [2, 7, 9]
    assert_equal "02:07:09", @st_time.to_s
  end


  def test_to_h
    assert_equal({ hours: 13, minutes: 37, seconds: 42 }, @st_time.to_h)
  end


  def test_to_a
    assert_equal [13, 37, 42], @st_time.to_a
  end


  def test_seconds_since_midnight
    secs = 42 + (37 * 60) + (13 * 60 * 60)
    assert_equal secs, @st_time.seconds_since_midnight
  end


  def test_to_i
    secs = 42 + (37 * 60) + (13 * 60 * 60)
    assert_equal secs, @st_time.to_i
  end


  def test_accessor_hours
    assert @st_time.respond_to?(:hours)
    assert_equal 13, @st_time.hours
  end


  def test_accessor_minutes
    assert @st_time.respond_to?(:minutes)
    assert_equal 37, @st_time.minutes
  end


  def test_accessor_seconds
    assert @st_time.respond_to?(:seconds)
    assert_equal 42, @st_time.seconds
  end


end