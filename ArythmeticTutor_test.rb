require 'test/unit'
require_relative 'arithmetic_tutor.rb'
require_relative 'advanced.rb'
require_relative 'player.rb'

class MyTest < Test::Unit::TestCase

  def setup
    @arythmetictutor=ArythmeticTutor.new
  end


  def test_point
    assert_equal(3, @arythmetictutor.point(2), 'Problem result')
  end
  def test_questionn
    assert_equal(0, @arythmetictutor.question(2).result, 'Problem result')
  end

end