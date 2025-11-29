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

  def at(index)
    return nil if index < 0 || index >= @size

    current = @head
    index.times { current = current.next_node }

    current.value
  end

  def pop
    
  end
end