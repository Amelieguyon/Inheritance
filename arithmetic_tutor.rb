require_relative 'player.rb'
require_relative 'question.rb'
require_relative 'basic.rb'
require_relative 'intermediate.rb'
require_relative 'advanced.rb'
require_relative 'master.rb'

class ArithmeticTutor
  def initialize
    @level_point=Array.new
    @player=Player.new
    @check=Array.new
    @answer=Array.new
    @number_question=IO.readlines("Tutor.dat")[1].to_i
    @listquestion=Array.new

  end

  def hello
    return "Welcome to the Arithmetic Tutor, #{@player.name}"
  end

  def rules
    return "Niveau 0 : Basic ; Niveau 1 : Intermediate ; Niveau 2 : Advanced , Niveau 3 : Master"
  end

  def question level
    return case level
             when 0 then Basic.new @player.my_generator
             when 1 then Intermediate.new @player.my_generator
             when 2 then Advanced.new @player.my_generator
             when 3 then Master.new @player.my_generator

           end
  end

  def point level
    return case level
             when 0 then 1
             when 1 then 2
             when 2 then 3
             when 3 then 4

           end
  end


  def answers
    level=0

    puts "LEVEL #{level} "
    @listquestion[0]=question(level)
    puts "#{@listquestion[0].to_s}"
    @answer[0]=gets.to_i
    if @listquestion[0].result==@answer[0]
      @check[0]= :CORRECT
      @level_point[0]=point(level)
    else @check[0]= :INCORRECT
    end

    puts "LEVEL #{level} "
    @listquestion[1]=question(level)
    puts "#{@listquestion[1].to_s}"
    @answer[1]=gets.to_i
    if @listquestion[1].result==@answer[1]
      @check[1]= :CORRECT
      @level_point[1]=point(level)
    else @check[1]= :INCORRECT
    end

    2.upto (@number_question-1) do |i|
      if @check[i-1]==:CORRECT && @check[i-2]==:CORRECT && level!=3 && @level_point[i-1]==@level_point[i-2]
      a=0
      level=level+1
      end

      if @check[i-1]==:INCORRECT && @check[i-2]==:INCORRECT && level!=0
        level_before=level
        level=level-1
      end

      puts "LEVEL #{level} "
      @listquestion[i]=question(level)
      puts "#{@listquestion[i].to_s}"
      @answer[i]=gets.to_i
      if @listquestion[i].result==@answer[i]
        @check[i]= :CORRECT
        @level_point[i]=point(level)
      else @check[i]= :INCORRECT
      end
    end

    return @check

  end


  def solves
    0.upto (@number_question-1) do |i|
     if @check[i] == :CORRECT
       yield "#{@listquestion[i]} #{@check[i]}"

     end
    end
    0.upto (@number_question-1) do |i|
      if @check[i] == :INCORRECT
        yield "#{@listquestion[i]} #{@check[i]}"
      end
    end
  end

  def total
    0.upto (@number_question-1) do |i|
      if @level_point[i]==nil
        @level_point[i]=0
      end
    end
    return @level_point.inject {|acc,n| acc + n}
  end

  def print_total
    return "#{@player.name}: your final result is #{total}"

  end
end