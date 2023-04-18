# linear_search
# Write a method linear_search(arr, target) that accepts an array and another input as target. The method should use a linear search to return the position of the element where the target is found. If the target is not found, return -1. You can assume the array contains unique elements.
# Examples
# linear_search(["a", "b", "c"], "b") # => 1
# linear_search(["a", "b", "c"], "f") # => -1 
# linear_search([42, 89, 23, 1], 1) # => 3
def linear_search(arr, target)
  arr.each.with_index do |el, i|
    # 一致したらその時点で終了
    return i if el == target
  end
  # 一致しなかったら-1を返す
  -1
end

# gets.chomp.split(" ").map(&:to_i)で入力を配列に変換
# gets.chomp.to_iで入力を数値に変換
# q: なんでsplit(" ")なのか
# a: split(" ")でスペース区切りで配列に変換している
# chompはスペース
input = gets.chomp.split(" ").map(&:to_i)
puts "Enter a number to search for: "

target = gets.chomp.to_i
result = linear_search(input, target)
result = "not found" if result == -1
puts "The index of #{target} is #{result}"

# ❯ ruby apr_18.rb
# 1 2 3
# Enter a number to search for: 
# 1
# The index of 1 is 0
