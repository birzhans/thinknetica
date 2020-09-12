NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i

puts 'str:'
str = gets.chomp

puts NUMBER_FORMAT =~ str
