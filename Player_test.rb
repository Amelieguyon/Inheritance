require 'test/unit'
require_relative 'player.rb'
class MyTest < Test::Unit::TestCase

  def setup
    @player=Player.new
    @name=@player.name
  end

  def test_initialize
    assert(@name== :Amelie, 'Problem result')
  end
end