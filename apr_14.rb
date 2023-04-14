# frozen_string_literal: true

# マージソート
def merge_sort(arr)
  # 配列の要素が1つになるまで、再帰的に分割する
  return arr if arr.size <= 1

  # 配列を半分に分割する
  mid = arr.size / 2
  # 左半分を分割する
  left = merge_sort(arr[0, mid])
  # 右半分を分割する
  right = merge_sort(arr[mid, arr.size - mid])

  merge(left, right)
end

# 左右の配列の先頭を比較し、小さい方を結果に追加する
def merge(left, right)
  # 結果を格納する配列
  sorted = []

  # 左右の配列のどちらかが空になるまで繰り返す
  until left.empty? || right.empty?
    # 左右の配列の先頭を比較し、小さい方を結果に追加する
    # 左の配列の先頭を削除し、結果に追加する
    # 右の配列の先頭を削除し、結果に追加する
    sorted << (left.first <= right.first) ? left.shift : right.shift
  end

  # 左右の配列のどちらかに要素が残っている場合は、結果に追加する
  # 両方とも空の場合は、sortedには何も追加されない
  # 両方とも空でない場合は、片方の配列に要素が残っているので、
  # その要素をすべて結果に追加する
  sorted + left + right
end

# 標準入力から配列を読み込む
# 1行目に要素数、2行目にスペース区切りの整数が入力される
arr = gets.split.map(&:to_i)
puts "before: #{arr}"
sorted_arr = merge_sort(arr)
puts "after: #{sorted_arr} "

# ❯ ruby apr_14.rb
# 4 8 2 93 8 4 555
# before: [4, 8, 2, 93, 8, 4, 555]
# after: [2, 4, 4, 8, 8, 93, 555]
