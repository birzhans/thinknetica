puts "This program returns purchase amount for given products."
puts "If you want to quit, enter 'stop'."

purchase = {}
total = 0

loop {
  puts "Please, enter product's name:"
  name = gets.chomp

  if name == 'stop'
    break
  end

  puts "Enter product's price:"
  price = gets.chomp.to_f

  puts "Enter amount:"
  amount = gets.chomp.to_f

  puts "-------------------------------"

  purchase[name] = { price: price, amount: amount }
  total += price * amount
}

puts "Your purchase:"
purchase.each { |name, sub_hash|
  p_total = sub_hash[:price] * sub_hash[:amount]
  puts "#{name}: #{sub_hash[:price]} x #{sub_hash[:amount]} | Total: #{p_total}."
}
puts "The total sum of purchase is #{total}."

  
  
