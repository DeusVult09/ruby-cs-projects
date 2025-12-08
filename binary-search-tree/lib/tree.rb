require_relative 'node'

class Tree
  attr_reader :root

  def initialize(array)
    array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?
      
      mid = array.length / 2
      root = Node.new(array[mid])

      root.left = build_tree(array[0...mid])
      root.right = build_tree(array[mid + 1..-1])
      root
  end

  def insert(value, node = @root)
    return Node.new(value) if @root.empty?

    if value < node.data
      node.left = insert(node.left, value)
    else
      node.right = insert(node.right, value)
    end
    node
  end

  def get_successor(node) #method to find a successor
    node = node.right #move to the right node because the succ of a node is the smallest from the right
    return nil if node.nil? #node has no right subtree - > no successor inside the subtree
    #otherwise enter the loop...
    while node.left #traverse through left node -> successor is the leftmost in the right subtree
      node = node.left # then stay on the left child. If there are more left children 
    end
    node #return leftmost node -> successor found -> the loop stops -> returns the value1
  end
  
  def delete(node = @root, value)
    return nil if node.nil?

    if value < node.data 
      node.left = delete(node.left, value)
      return node
    elsif value > node.data
        node.right = delete(node.right, value)
        return node
    else
      #found and delete if there is 1 child 
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      #delete if there are 2 children in the node
      succ = get_successor(node) #we are storing successor value that we found
      node.data = succ.data # exchanging original node value with succ value 
      node.right = delete(node.right, succ.data) # nd finally deleting the original node which will always be from the right subtree
      node
    end
  end

  def find(node = @root, value)
    return nil if node.nil?
    if value == node.data #if the node we are currently at equals to the value we are asking for
      return node  #-> return it
    elsif value < node.data #if not search it from the left subtree
      return find(node.left, value) 
    else
      return find(node.right, value) #or right subtree
    end
  end

  def level_order(node = @root, &block)
    return Array.new if node.nil?
    queue = [node] #take the root into the queue and make it the 1st node to be processes
    output = [] #remove the node and return it to a new array

    while !queue.empty? #unless the queue array is empty = [] 
      current_node = queue.shift #remove its value and store it in the curr variable
      if block_given? #if there is a block 
        yield current_node #print curr_node
      else
        output << current_node.data #otherwise just return an array with node values 
      end
      queue << current_node.left if current_node.left #add value from the left to the queue
      queue << current_node.right if current_node.right #add from the left right
    end
    
    output 
  end

  def recursive_lvl_order(queue = [root], output = [], &block)
    return output if queue.empty?
    curr_node = queue.shift
    if block_given?
      yield curr_node
    else
      output << curr_node.data 
    end
    queue << curr_node.left if curr_node.left
    queue << curr_node.right if curr_node.right
        
    recursive_lvl_order(queue, output, &block)
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    if block_given?
      yield node
    else
      result << node.data
    end
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)

    result
  end
  
  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left, result, &block)

    if block_given?
      yield node
    else
      result << node.data
    end
    inorder(node.right, result, &block)

    result
  end

  def postorder(node = @noode, result = [], &block)
    return result if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)

    if block_given?
      yield node
    else
      result << node.data
    end
    result 
  end

  def height(node)
    if node.nil?
      return -1
    else
      left_h = height(node.left)
      right_h = height(node.right)
      1 + [left_h, right_h].max #we need to count from the root to the furtherest leaf node
    end #we need .max to identify the logest possible path down
  end

  def depth(value, node = @root, current = 0)
    return -1 if node.nil?

    return current if node.data == value # base case -> we found the node and return the depth
    if value < node.data #search that value node from the elft subtree
      depth(node.left, value, current+ 1) #add 1 while going down
    else #search the value input from the right subtree
      depth(node.right, value, current + 1)
    end
  end

  def balanced?(node = @root)
    return true if node.nil?# if subtree empty then balanced
    return (height(node.left) - height(node.right)).abs <= 1 && balanced?(node.left) && balanced?(node.right)
    #calculating height of left and right subtrees of current node
    #checking if every node in the tree satisfies the balance condition, not just the current node.
  end

  def rebalance
    sorted = inorder
    @root = build_tree(sorted)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end