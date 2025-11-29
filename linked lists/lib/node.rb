class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @vlaue = value
    @next_node = next_node
  end
end