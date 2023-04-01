class MyHashTable
    INITIAL_SIZE = 10

    def initialize
      @buckets = Array.new(INITIAL_SIZE)
    end

    def hash(key)
      key.to_s.hash % @buckets.size
    end

    def put(key, value)
      index = hash(key)

      if @buckets[index].nil?
        @buckets[index] = [[key, value]]
      else
        found = false
        @buckets[index].each do |pair|
          if pair[0] == key
            pair[1] = value
            found = true
            break
          end
        end
        @buckets[index] << [key, value] unless  found
      end
    end

    def get(key)
      index = hash(key)
      return nil if @buckets[index].nil?
      @buckets[index].each do |pair|
        return pair [1] if pair[0] == key
      end

      nil
    end

    def delete(key)
      index = hash(key)
      return nil if @buckets[index].nil?

      @buckets[index].each_with_index do |pair, i|
        if pair[0] == key
          @buckets[index].delete_at(i)
          return pair[1]
        end
      end

      nil
    end
  end

  my_hash = MyHashTable.new
  my_hash.put('Hello', 'World')
  my_hash.put('name', 'John')

  puts my_hash.get('Hello')
  puts my_hash.get('name')
  my_hash.delete('name')
  puts my_hash.get('name')
