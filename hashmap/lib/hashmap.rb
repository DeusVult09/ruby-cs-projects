class HashMap
  LOAD_FACTOR = 0.75
  CAPACITY = 16

  def initialize
    @load_factor = LOAD_FACTOR
    @capacity = CAPACITY
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def bucket_index(key)
    hash(key) % @capacity
  end

  def set(key, value)
    index = bucket_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    if @size / @capacity > @load_factor
      resize
    end
    
    bucket << [key, value]
    @size += 1
  end

  def resize
    
  end
end