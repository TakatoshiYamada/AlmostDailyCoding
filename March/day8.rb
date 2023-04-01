args = ARGV.map(&:to_i)
even_numbers = args.select(&:even?)

if even_numbers.empty?
  puts 'no nubers in the arguments.'
else
  even_avg = even_numbers.sum / even_numbers.size
  puts "even_avg = #{even_avg}"
end
