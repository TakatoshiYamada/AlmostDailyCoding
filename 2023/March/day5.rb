# いくつかの数字が入ったリストが与えられたとき、そのリスト内の全ての偶数の平均値を求めるプログラムを作成してください。
# 例えば、与えられたリストが [1, 2, 3, 4, 5] の場合、偶数の平均値は (2 + 4) / 2 = 3 となります。
# また、リストが空の場合や偶数が含まれていない場合は、0を返すようにしてください。
# これを解決するためのプログラムを書いてみてください。

args = ARGV

result = 0
even_cnt = 0
if args.length > 0
  args.each do |arg|
    if arg.to_i % 2 == 0
      result += arg.to_i
      even_cnt += 1
    end
  end

  if even_cnt > 0
    even_avg = result / even_cnt
    puts "even_avg = #{even_avg}"
  else
    puts "no even number in argv"
  end
else
  puts "no argv."
end
