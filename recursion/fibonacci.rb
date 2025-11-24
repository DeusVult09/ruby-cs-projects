def fibs(n)
  puts "OOPS! Enter a valid number!" unless n > 0 
  fib = [1, 1]

  (2...n).each do |pos|
    fib << fib[pos - 1] + fib[pos - 2]
  end
  fib
end

fibs(10)

def fibs_rec(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  
  prev = fibs_rec(n - 1)
  prev + [prev [-1] + prev [-2]]
end


fibs_rec(8)