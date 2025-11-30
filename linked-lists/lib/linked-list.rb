require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)

    @tail = @head if @tail.nil?

    @size += 1
  end

  def node_at(index)
    return nil if index < 0 || index >= @size

    current = @head
    index.times { current = current.next_node }

    current.value
  end

  def pop
    return nil if @size == 0

    if @head == @tail
      value = @head.value
      @head = nil
      @tail = nil
      @size = 0
      return value
    end
    
    current = @head
    current = current.next_node until current.next_node == @tail 

    value = @tail.value
    current.next_node = nil
    @tail = current
    @size -= 1
    value
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)  
    current = @head
    index = 0

    while current
      return index if current.value == value
      current = current.next_node
      index += 1  
    end
    nil
  end

  def to_s
    result = ""
    current = @head

    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end

    result + 'nil'
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return append(value) if index == @size
    return nil if index < 0 || index >= @size

    new_node = Node.new(value)
    current = @head

    (index - 1).times do 
      current = current.next_node
    end

    new_node.next_node = current.next_node
    current.next_node = new_node

    @size += 1
  end

  def remove_at(index)
    return nil if index < 0 || index >= @size

    if index == 0
      value = @head.value 
      @head = @head.next_node
      @tail = nil if @head.nil?
      @size -= 1
      return value
    end
      current = @head
      (index - 1).times { current = current.next_node }

      removed = current.next_node
      value = removed.value
      current.next_node = removed.next_node

      if removed == @tail
        @tail = current
      end
      @size -= 1
      value
  end
end