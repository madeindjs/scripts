#!/usr/bin/ruby
#
# count number of minutes passed on a specific ticket
# to count them automatiquelly add this in crontab
#
#     * 7,8,9,10,11,14,15,16,17,18,19 * * * cd ~/www && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' >> ~/.tickets_count.log
#
# add branch name of your project

require 'colorize'# gem install colorize
require 'optparse'

LOG_FILE_PATH = '.tickets_count.log'

# verify file exists
unless File.exist? LOG_FILE_PATH
  puts "File '.tickets_count.log' was not found"
  puts 'you should install this crontab'
  puts ''
  puts "   * 7,8,9,10,11,14,15,16,17,18,19 * * * cd %s && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\\)/\\1/' >> %s/.tickets_count.log" % [Dir.pwd, Dir.pwd]
  exit
end

# parse command line args
options = {}
OptionParser.new do |opts|
  opts.banner = <<END
ticket_count.rb will use a crontab & Git to log wich current branch you work on.
Then you'll just need to enter `ticket_count.rb` to get a resume of time spend
on Git branch

Usage: ticket_count.rb [options]
END

  # opts.on('-i', '--install', 'Add a crontab for this repository') {}
  opts.on('-d', '--delete BRANCHE_NAME', 'Delete logs for this branch') { |v| options[:delete] = v }
  opts.on('-c', '--clean', 'Remove all current logs from file') { |v| File.delete(LOG_FILE_PATH) ; exit }
  opts.on('-h', '--help', 'Prints this help') { puts opts ; exit }
end.parse!


if branch = options[:delete]
  logs_array = File.readlines(LOG_FILE_PATH)

  logs_array.delete_if{|log| log == branch }

  File.open(LOG_FILE_PATH, "w") do |file|
    logs_array.each do |line|
      file.write line unless line.chomp("\n") == branch
    end
  end
end

# get values
tickets = {};
File.open(LOG_FILE_PATH, "r") do |file|
  file.each_line do |ticket|
    ticket.chomp!
    if tickets.include? ticket
      tickets[ticket] += 1
    else
      tickets[ticket] = 1
    end
  end
end

# get length of the longer ticket name for output
max_length = 0
tickets.keys.each do |ticket|
  max_length = ticket.length if ticket.length > max_length
end
max_length += 1

# display them
tickets.sort_by{ |k, v| v }.reverse.each do |ticket,  value|
  puts "\t%s %s %.2f" % [
    ticket.colorize(:light_blue),
    " "*(max_length - ticket.length),
    (value / 60.0)
  ]
end
