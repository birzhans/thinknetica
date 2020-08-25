puts "What is your name?"
name = gets.chomp

puts "What is your height?"
height = gets.chomp.to_i

perfect_weight = (height - 110) * 1.15

if perfect_weight >= 0
  puts "Your perfect weight is #{perfect_weight}"
else
  puts "Your weight is already optimal"
end
