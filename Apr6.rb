def insertion_sort(array)
    n = array.length
    (1...n).each do |i|
        key = array[i]
        j = i - 1
        while j >= 0 && array[j] > key
          array[j + 1] = array[j]
          j -= 1
        end
        array[j + 1] = key
    end
    array
end

sort_argv = ARGV.map { |i| i.to_i }
puts "Insertion Sort:#{insertion_sort(sort_argv)}"
