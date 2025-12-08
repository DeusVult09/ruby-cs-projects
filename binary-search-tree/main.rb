require_relative 'lib/tree'

arr = Array.new(15) { rand(1..100) }
puts "Original array: #{arr.inspect}"
tree = Tree.new(arr)
puts "Unique sorted array: #{arr.sort.uniq.inspect}"
puts "Balanced?: #{tree.balanced?}"
puts "Level Order: #{tree.level_order.inspect}"
tree.pretty_print