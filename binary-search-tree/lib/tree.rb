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

  def get_successor(node) #method to find a successor
    node = node.right #move to the right node
    return nil if node.nil? #if there is no node after, return nil
    #otherwise enter the loop...
    while node.left #traverse a through left node -> Does it have a child? Yes?
      node = node.left # then stay on the left child. If there are more left children 
    end
    node #loop until we find the last left child. Then the loop stops, Returns the value1
  end
  
  def delete(node, value)
    return nil if node.nil?

    if value < node.data 
      node.left = delete(node.left, value)
      return node
    elsif value > node.data
        node.right = delete(node.right, value)
        return node
    else
    #delete if there is 1 child 
    return node.right if node.left.nil?
    return node.left if node.right.nil?

    #delete if there are 2 children in the node
    succ = get_successor(node) #we are storing successor value that we found
    node.data = succ.data # exchanging original node value with succ value 
    node.right = delete(node.right, succ.data) # nd finally deleting the original node which will always be from the right subtree
    node
    end

    def find(node, value)
      return nil if node.nil?
  
      if value == node.data #if the node we are currently at equals to the value we are asking for -> return it
        return node
      elsif value < node.data #if not search it from the left subtree
        return find(node.left, value) 
      else
        return find(node.right, value) #or right subtree
      end

    end
  end


end