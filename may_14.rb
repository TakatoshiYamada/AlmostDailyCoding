# euclidean algorithm

def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

# 標準入力
a, b = gets.split.map(&:to_i)

puts gcd(a, b)
