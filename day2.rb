def selection_sort(arr)
  n = arr.length

  # 配列の要素を順番に比較し、最小値のインデックスを探す
  (0..n-2).each do |i|
    min_idx = i
    (i+1..n-1).each do |j|
      min_idx = j if arr[j] < arr[min_idx]
    end

    # 最小値を先頭要素と交換する
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end

  return arr
end

# テスト用の配列
arr = [64, 25, 12, 22, 11]
puts arr.to_s

# 選択ソートを実行する
sorted_arr = selection_sort(arr)

# 結果を表示する
puts sorted_arr.to_s  # => [11, 12, 22, 25, 64]
