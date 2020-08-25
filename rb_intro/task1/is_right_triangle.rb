puts "This program prints triangle's type for given sides."
puts "Please, type first side:"
a = gets.chomp.to_f

puts "Type second side:"
b = gets.chomp.to_f

puts "please, type third side:"
c = gets.chomp.to_f

hypotenuse = [a, b, c].max
right_side = nil

if hypotenuse == a
  right_side = b ** 2 + c ** 2
elsif hypotenuse == b
  right_side = a ** 2 + c ** 2
elsif hypotenuse == c
  right_side = a ** 2 + b ** 2
end
	

if a == b && a == c
  puts "This is an equilateral and isosceles triangle."
elsif a == b || b == c
  puts "This is an isosceles triangle."
elsif hypotenuse && (hypotenuse ** 2 == right_side)
  puts "This is a right triangle"
end


