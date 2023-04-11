def merge_sort(arr)
    return arr if arr.size <= 1
  
    mid = arr.size / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])
  
    merge(left, right)
  end
  
  def merge(left, right)
    result = []
  
    while !left.empty? && !right.empty?
      if left[0] <= right[0]
        result << left.shift
      else
        result << right.shift
      end
    end
  
    result + left + right
  end
  
  arr = [5, 2, 8, 1, 6, 3, 9, 4, 7]
  p merge_sort(arr)
  