class Tree
  @array_to_sort = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
  attr_reader :root

  def initialize
    @root = buid_tree
  end

  def build_tree(array, arr_start, arr_end)
    return nil unless arr_start > arr_end
      mid = arr.length / 2
      root = Node.new(arr[mid])

      root.left = build_tree(array, arr_start, mid - 1)
      root.right = build_tree(array, arr_start, mid + 1)
      return root

      sorted = array_to_sort.sort.uniq

  end
    
end