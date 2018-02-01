#!/usr/bin/ruby
#
# count number of minutes passed on a specific ticket
# to count them automatiquelly add this in crontab
#
#     * 7,8,9,10,11,14,15,16,17,18,19 * * * cd ~/www && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' >> ~/.tickets_count.log
#
# add branch name of your project

# verify file exists
unless File.exist? ".tickets_count.log"
	puts "File '.tickets_count.log' was not found"
	puts 'you should install this crontab'
	puts ''
	puts "   * 7,8,9,10,11,14,15,16,17,18,19 * * * cd %s && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\\)/\\1/' >> %s/.tickets_count.log" % [Dir.pwd, Dir.pwd]
	exit
end

# get values
tickets = {};
File.open(".tickets_count.log", "r") do |file|
	file.each_line do |ticket|
		ticket.chomp!
		if tickets.include? ticket
			tickets[ticket] += 1
		else
			tickets[ticket] = 1
		end
	end
end

# display them
tickets.each do |ticket,  value|
	puts "#{ticket}: spend %.2f" % (value / 60.0)
end

# delete file?
puts ''
puts 'delete file (press "y" to continue)'
File.delete(".tickets_count.log") if STDIN.gets.chomp == 'y'
