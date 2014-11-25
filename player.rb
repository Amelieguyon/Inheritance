class Player

  attr_reader :my_generator, :name

  def initialize
    @name=IO.readlines("Tutor.dat")[0]
    @seed=IO.readlines("Tutor.dat")[2].to_i
    @my_generator=Random.new (@seed)
  end

end