def heap_sort(arr)
  n = arr.length
  last_index = n - 1

  # ヒープ構造の作成
  last_index.downto(0) do |i|
    heapify(arr, n, i)
  end

  # ヒープ構造から最大値を取り出して、ソート済みデータに追加する
  last_index.downto(1) do |i|
    arr[0], arr[i] = arr[i], arr[0]
    heapify(arr, i, 0)
  end
  arr
end

def update_largest(arr, length, index)
  largest = index
  left = 2 * index + 1
  right = 2 * index + 2

  largest = left if left < length && arr[left] > arr[largest]

  largest = right if right < length && arr[right] > arr[largest]

  largest
end

def heapify(arr, length, index)
  largest = update_largest(arr, length, index)

  return unless largest != index

  arr[index], arr[largest] = arr[largest], arr[index]
  heapify(arr, length, largest)
end

args = ARGV.map(&:to_i)
puts "heap_sort:#{heap_sort(args)}"
