class MyHashTable
  INITIAL_SIZE = 10

  def initialize
    @buckets = Array.new(INITIAL_SIZE)
  end

  def hash(key)
    key.to_s.hash % @busckets.size
  end

  def put(key, value)
    index = hash(key)

    if @busckets[index].nil?

    end
  end
end
