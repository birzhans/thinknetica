require_relative 'train'

def create_train
  puts "Enter train's number:"
  number = gets.chomp
  train = Train.new(number)
rescue RuntimeError => e
  puts "#{e.message}"
  retry
ensure
  puts "The train with number #{number} was created."
end


