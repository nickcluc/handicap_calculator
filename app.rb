require_relative './initializer'

hc = Handicap.new ARGV[0]

puts "With your input from '#{ARGV[0]}', your handicap is #{hc.calculate}"
