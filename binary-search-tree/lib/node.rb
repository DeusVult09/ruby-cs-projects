class Node
  attr_accessor :data, :left, :right

  def initialize(value, left, right)
    @data = value
    @left = left
    @right = right
  end

  def children
    [@left, @right]
  end
end