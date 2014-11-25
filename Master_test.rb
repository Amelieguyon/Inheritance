require 'test/unit'
require_relative 'master.rb'
require_relative 'question.rb'
class MyTest < Test::Unit::TestCase

  def setup
    @my_generator= Random.new (1035)
    @master=Master.new @my_generator
  end


  def test_result
    assert(@master.result== 0, 'Problem result')
  end
end