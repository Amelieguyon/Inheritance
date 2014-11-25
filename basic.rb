require_relative 'question.rb'
class Basic<Question
  def initialize my_generator
    @n1=my_generator.rand (1..9)
    @n2=my_generator.rand (1..9)
    @sign=my_generator.rand (2)
  end

  def to_s
    if @sign==1
    return "What is #{@n1} + #{@n2} ?"
    else return "What is #{@n1} - #{@n2} ?"
    end
  end
  def result
    if @sign==1
    return @n1+@n2
    else return @n1-@n2
    end
  end
end