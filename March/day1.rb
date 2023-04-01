def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
puts bubble_sort(array)
