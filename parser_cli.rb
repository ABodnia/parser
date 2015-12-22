require_relative 'parser'

file_dir = ARGV[0] ? File.expand_path(ARGV[0]) : Dir.pwd
puts file_dir
Parser.new(file_dir).parse_and_print