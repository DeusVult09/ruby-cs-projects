class HashMap
  LOAD_FACTOR = 0.75
  CAPACITY = 16
  THRESHOLD = (CAPACITY * LOAD_FACTOR).floor

  def initialize
    attr_reader :capacity, :threshold, :load_factor, :size
    
    @load_factor = LOAD_FACTOR
    @capacity = CAPACITY
    @threshold = THRESHOLD
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
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    index
  end

  def set(key, value)
    resize if needs_resize?

    index = bucket_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end 
    bucket << [key, value]
    @size += 1
  end

  def needs_resize?
    (@size + 1) >  @threshold
  end

  def resize
    old_buckets = @buckets

    @capacity *= 2
    @threshold = (@capacity * @load_factor).floor
    @buckets = Array.new(@capacity) { [] }
    @size = 0

    old_buckets.each do |bucket|
      bucket.each { |key, value| set(key, value) }
    end
  end

  def get(key)
    index = bucket_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      return pair[1] if key[0] == key
    end
    nil
  end

  def has?(key)
    index = bucket_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      return true if pair[0] == key
    end
    false
    #or even better to use .any? predicate enumerable,
    # since false is returned automatically
    # @buckets[index].any? { |pair| pair[0] == key }
  end

  def remove(key)
    index = bucket_index(key)
    bucket = @buckets[index]

    if pair = bucket.detect { |k, v| k == key }
      return pair
    else 
      nil
    end 
    bucket.delete(pair)
    @size -= 1
    pair[1]
  end
end