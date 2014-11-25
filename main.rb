require_relative 'player.rb'
require_relative 'question.rb'
require_relative 'basic.rb'
require_relative 'intermediate.rb'
require_relative 'advanced.rb'
require_relative 'master.rb'
require_relative 'arithmetic_tutor.rb'

tutor=ArithmeticTutor.new


puts "#{tutor.hello}"

puts "#{tutor.rules}"

tutor.answers

tutor.solves {|x| puts "#{x}"}

puts "#{tutor.print_total}"



