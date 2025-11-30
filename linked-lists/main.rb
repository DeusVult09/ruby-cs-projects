require_relative 'lib/linked-list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list

puts 'Prepending list:'
list.prepend('otter')
list.prepend('kayotes')
puts list.to_s

puts 'Access value at index 5:'
puts "The node at index 5 is -> #{list.node_at(5)}"

puts 'Display values in the head and tail:'
puts "Head node is -> #{list.head.value} and tail node is -> #{list.tail.value}"

puts "The total size of nodes in the list is: #{list.size}"

puts "Let's remove the last node! Here we go! #{list.pop}"
puts "Update the list:"
puts list

puts "Wait! Let's check if our node list contains my favourite animal"
puts "Do you have a wolf in your list? #{list.contains?('wolf')}"

puts "Then, find a parrot from your list for me! The parrots is at #{list.find('parrot')}"

puts "We will insert a new bird just before a parrot. Here we go! #{list.insert_at('flamingo', 4)}"
puts list

puts "You know what... Actually let's remove it and kepp the list as it is! #{list.remove_at(4)} byeee!"
puts list
