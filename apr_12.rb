i = ARGV.map { |a| a.to_i }

unless i >= 0 && i <=100
    puts "0以上100以下の整数を入力してください"
end

puts i*2
