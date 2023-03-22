def selection_sort(arr)
  n = arr.length

  # Compare array elements
  # in order and find the index
  # with the smallest value
  (0..n-2).each do |i|
    min_idx = i
    (i + 1..n-1).each do |j|
      min_idx = j if arr[j] < arr[min_idx]
    end

    # Exchange the minimum value
    # with the first element.
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end

  arr

end

arr = [64, 25, 33, 12, 444]

# different p and puts
p arr.to_s
puts arr.to_s
p arr.to_s.class
puts arr.to_s.class

sorted_arr = selection_sort(arr)

# Result
puts sorted_arr.to_s
