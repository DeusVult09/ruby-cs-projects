class Tree
  attr_reader :root

  def initialize
    @root = buid_tree(array)
    array = array.sort.uniq
  end

  def build_tree(array)
    return nil if array.empty?

      mid = arr.length / 2
      @root = Node.new(arr[mid])

      @root.left = build_tree(array[0...mid])
      @root.right = build_tree(array[mid + 1..-1])
      @root
  end

  def insert(value)
    return Node.new if @root.empty?

    if value < @root.data
      @root.left = insert(@root.left, value)
    else
      @root.right = insert(@root.right, value)
    end
    @root
  end

  def getSuccessor(current)
    current = current.right
    return nil if current.nil?

    while current.left
      current = current.left
    end
    current
  end
  
  def delete(value)
    node = @root
    return node if node.nil?
    #delete if there is o
  end
end