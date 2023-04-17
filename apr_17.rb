# 1 以上 100 以下の整数 N が標準入力から与えられます。
# N を 5 で割ったあまりを標準出力するプログラムを作成してください。

# Nを標準入力から取得
n = gets().to_i

# 1以上100以下の整数かどうか判定
if n >= 1 && n <= 100
  results = n % 5
  puts results
else
  puts "入力は1以上100以下"
end


s = gets.to_s

str = ""
3.times do
  # q: 文字列を改行なしで連結したい
  # a: << を使う
  str << s.strip # 末尾の改行を削除
end

puts str

# 長さ 5 の文字列 S が標準入力から与えられます。
# 文字列 S の中央の文字を出力してください。
# たとえば入出力例 1 に示す通り、S= power に対しては、文字 w を出力します。

s2 = gets.chomp

if s2.length == 5
  # q: 文字列を配列に入れたい
  # a: chars を使う
  str = s2.chars
  puts str[2]
else
  puts "NG"
end


x = gets.to_i

if x >= 0 && x <= 23
  result = 24 - x
  puts result
else
  puts "NG"
end
