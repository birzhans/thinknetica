puts "This program returns roots (if any) of quadratic equation."
puts "Please, type the coefficient of a:"
a = gets.chomp.to_f

puts "type b:"
b = gets.chomp.to_f

puts "type c:"
c = gets.chomp.to_f

d = b**2 - (4 * a * c)

if d > 0
  sqrt_d = Math.sqrt(d)
  x1 = (-b - sqrt_d) / (2.0 * a)
  x2 = (-b + sqrt_d) / (2.0 * a)
  puts "Roots: #{x1}, #{x2}."
elsif d == 0
  x = -b / (2.0 * a)
  puts "Root: #{x}."
else
  puts "No roots."
end

