require 'test/unit'
require_relative 'basic.rb'
require_relative 'question.rb'
class MyTest < Test::Unit::TestCase

    def setup
      @my_generator= Random.new (1035)
      @basic=Basic.new @my_generator
    end


    def test_result
      assert(@basic.result== -3, 'Problem result')
    end
end