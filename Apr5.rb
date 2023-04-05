def selection_sort(arr)
    n = arr.length
    (0...n).each do |i|
       min_index = i
        (i + 1...n).each do |j|
            min_index = j if arr[j] < arr[min_index]
        end
        arr[i], arr[min_index] = arr[min_index], arr[i] if i != min_index
    end
    arr
end

argv_arr = ARGV.map { |argv| argv.to_i}
puts "Sorted array: #{selection_sort(argv_arr)}"
