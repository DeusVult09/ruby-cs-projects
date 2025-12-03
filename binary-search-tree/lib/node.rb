class Node
  include Comparable
  attr_accessor :data, :left, :right
  
  def initialize(value, left = nil, right = nil)
    @data = value
    @left = left
    @right = right
  end

  def children
    [@left, @right]
  end

  def <=> (other)
    return nil unless other.is_a?(Node)
      data <=> other.data
  end
end