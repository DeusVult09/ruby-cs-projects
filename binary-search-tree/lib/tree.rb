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

  def get_successor(node)
    node = node.right
    return nil if node.nil?

    while node.left
      node = node.left
    end
    node
  end
  
  def delete(node, value)
    return node if node.nil?

    if value > node.data 
      node.right = delete(node.right, value)
    elsif value < node.data
        node.left = delete(node.left, value)
    end
    

    #delete if there is 1 child 
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    #delete if there are 2 children in the node
    succ = get_successor(node)
    node.data = succ.data
    node.right = delete(node.right, succ.data)
    node
  end
end