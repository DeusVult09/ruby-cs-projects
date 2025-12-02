require_relative 'lib/hashmap'

test = HashMap.new()

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'healthy')
test.set('dog', 'brown')
test.set('elephant', 'huge')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'majestic')
test.set('moon', 'silver')

puts test.clear
puts test.length

