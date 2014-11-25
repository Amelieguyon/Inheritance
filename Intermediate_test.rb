require 'test/unit'
require_relative 'intermediate.rb'
require_relative 'question.rb'
class MyTest < Test::Unit::TestCase

  def setup
    @my_generator= Random.new (1035)
    @intermediate=Intermediate.new @my_generator
  end


  def test_result
    assert(@intermediate.result== -36, 'Problem result')
  end
end