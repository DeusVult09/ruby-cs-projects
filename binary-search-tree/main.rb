require_relative 'lib/tree'

arr = Array.new(15) { rand(1..100) }
puts "Original array: #{arr.inspect}"
tree = Tree.new(arr)
5.times { |i| tree.insert(101 + i) }
puts "Unique sorted array: #{arr.sort.uniq.inspect}"
puts "Balanced?: #{tree.balanced?}"
puts "Level Order: #{tree.level_order.inspect}"
tree.pretty_print
tree.rebalance
puts "Balanced?: #{tree.balanced?}"
tree.pretty_print
puts "Inorder: #{tree.inorder}"
tree.pretty_print
puts "Preorder: #{tree.preorder}"
tree.pretty_print
puts "Postorder: #{tree.postorder}"
tree.pretty_print