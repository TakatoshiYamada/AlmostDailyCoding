# 二分探索
# 与えられた配列の中から、与えられた値を探し出す。
# 与えられた値が配列の中に存在する場合は、その値のインデックスを返す。
# 与えられた値が配列の中に存在しない場合は、-1を返す。
# 与えられた配列は昇順にソートされているものとする。
# 与えられた配列の要素数は、1以上であるものとする。
# 与えられた配列の要素は、整数であるものとする。
# 与えられた値は、整数であるものとする。

def binary_search(arr, target)
  # 左側のインデックス
  left = 0
  # 右側のインデックス
  right = arr.length - 1

  while left <= right
    # 中央のインデックス
    mid = (left + right) / 2
    if arr[mid] == target
      mid
    elsif arr[mid] < target
      # 中央より左側のインデックスを更新
      # q: なぜ、mid +1 なのか？
      # a: 既に調べた中央の値は、targetより小さいので、調べる必要がないため
      left = mid + 1
    else
      # 中央より右側のインデックスを更新
      # q: なぜ、mid -1 なのか？
      # a: 既に調べた中央の値は、targetより大きいので、調べる必要がないため
      right = mid - 1
    end
  end
  -1
end

# 標準入力から、配列の要素数と、配列の要素を取得
input_arr = ARGV.map(&:to_i)
puts "arr: #{input_arr}"
ARGV.clear

# 標準入力から、探す値を取得
# 標準入力から数字を1文字取得
# q: なぜ、chompを使うのか？
# a: 改行コードを取り除くため
# q: STDIN.gets と、getsは一緒では
# a: 一緒
input_target = gets.chomp.to_i
puts "target: #{input_target}"

# 標準出力に、結果を出力
result = binary_search(input_arr, input_target)
puts "result: #{result}"

# ❯ ruby apr_19.rb 1 2 3 4 5
# arr: [1, 2, 3, 4, 5]
# 4
# target: 4
# result: 3

# ❯ ruby apr_19.rb 1 2 3 4 5
# arr: [1, 2, 3, 4, 5]
# 1
# target: 1
# result: 0

# ❯ ruby apr_19.rb 1 2 3 4 5
# arr: [1, 2, 3, 4, 5]
# 0
# target: 0
# result: -1
