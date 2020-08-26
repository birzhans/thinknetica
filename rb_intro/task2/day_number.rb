months = {
  0 => 31,
  1 => 28,
  2 => 31,
  3 => 30,
  4 => 31,
  5 => 30,
  6 => 31,
  7 => 31,
  8 => 30,
  9 => 31,
  10 => 30,
  11 => 31,
}

puts "This program returns day's number starting from the beginning."

puts "Please, enter a year:"
year = gets.chomp.to_i

puts "Enter a month:"
month = gets.chomp.to_i

puts "Enter a day:"
day = gets.chomp.to_i

if year % 4 == 0 && year % 100 != 0
  months[1] = 29
end

days = day

for idx in 0..(month - 2)
  puts idx
  days += months[idx]
end

puts "The given date is #{days}th day."


