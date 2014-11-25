require 'test/unit'
require_relative 'advanced.rb'
require_relative 'question.rb'
class MyTest < Test::Unit::TestCase

  def setup
    @my_generator= Random.new (1035)
    @advanced=Advanced.new @my_generator
  end


  def test_result
    assert((@advanced.result)==0, 'Problem result')
  end
end