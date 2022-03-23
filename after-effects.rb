#!/usr/bin/env ruby
system "gem install csv"
system "gem install ruby-notify-send"
system "gem install colorize"
system "clear"
system "cat ./changelog.txt"
version = %x[cat ./version-check]
installed = %x[cat ./installed-version]
puts "installed : #{installed.to_s}"
puts "online : #{version.to_s}"
puts "All Done, Goodbye!"
