# frozen_string_literal: true

def quick_sort(arr)
  return arr if arr.length <= 1

  # pivotを配列からランダムに選択し、削除
  pivot = arr.delete_at(rand(arr.length))

  # ピボットより小さい値と大きな値を分ける
  less, greater = arr.partition { |i| i <= pivot }

  # 再帰的にソートし、結果を連結
  quick_sort(less) + [pivot] + quick_sort(greater)
end

input = gets.split(' ').map(&:to_i)
puts "ソート前#{input}"
result = quick_sort(input)
puts "ソート後#{result}"
