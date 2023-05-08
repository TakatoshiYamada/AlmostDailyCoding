#!/usr/bin/env ruby

def generate_toc_line(line)
  heading_level = line.count('#')
  title = line.gsub(/#+\s*/, '')
  anchor = title.strip.downcase.gsub(/[^a-z0-9]+/, '-')

  indent = '  ' * (heading_level - 1)
  toc_line = "#{indent}* [#{title}](##{anchor})"
  return toc_line
end

if ARGV.length != 1
  puts "Usage: #{$0} <markdown file>"
  exit 1
end

file_path = ARGV[0]

unless File.exist?(file_path)
  puts "File not found: #{file_path}"
  exit 1
end

File.open(file_path, 'r') do |file|
  toc_line = []
  file.each_line do |line|
    if line.start_with?('#')
      toc_line << generate_toc_line(line)
    end
  end
  puts toc_line.join("\n")
end
