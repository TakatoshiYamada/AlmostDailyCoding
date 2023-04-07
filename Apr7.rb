def heap_sort(arr)
  n = arr.length

  # ヒープ構造の作成
  (n - 1).downto(0) do | i |
    heapify(arr, n, 1)
  end

  # ヒープ構造から最大値を取り出して、ソート済みデータに追加する
  (n - 1).downto(0) do |i|
    arr[0], arr[[i]] = arr[i], arr[0]
    heapify(arr, i, 0)
  end
  arr
end
