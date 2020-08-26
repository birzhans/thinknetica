fib = [0, 1]
current = 1

while current <= 100
  fib.push(current)
  current = fib[-1] + fib[-2]
end

puts fib


