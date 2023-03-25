args = ARGV

result = 0
if args.length > 0
  args.each do |arg|
    result + arg if arg % 2 == 0
  end

  avg = result / result.length
  puts "avg = ${result/resu}"
else
  puts 'no args'
end
