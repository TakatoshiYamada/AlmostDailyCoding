# frozen_string_literal: true

def quick_sort(arr)
  return arr if arr.length <= 1

  # pivotを配列から取り出す
  pivot = arr.delete_at(rand(arr.length))

  # pivotより小さい値を格納する配列
  less = []

  # pivotより大きい値を格納する配列
  greater = []

  arr.each do |i|
    if i <= pivot
      less << i
    else
      greater << i
    end
  end

  return quick_sort(less) + [pivot] + quick_sort(greater)
end

input = gets.split(' ').map(&:to_i)
puts "ソート前#{input}"
result = quick_sort(input)
puts "ソート後#{result}"
