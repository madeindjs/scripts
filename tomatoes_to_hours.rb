#!/usr/bin/env ruby
# Convert number of pomodore cycle to hours

raise ArgumentError.new('Please enter a number') if ARGV.count == 0

qty  = ARGV[0].chomp.to_f
time = (qty * (25.0/60.0)).round(1)
puts "#{qty} tomatoes is equivalent to #{time} hours"
