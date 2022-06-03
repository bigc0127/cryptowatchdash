#!/usr/bin/env ruby
system "rm ./core.rb"
system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/core.rb"
system "clear"
system "sudo whoami >> /dev/null"
modcheck = %x[stat --format '%a' /var/lib/gems/]
if modcheck.to_i != 777
  system "clear"
  print "permissions for gemfiles not correct... fixing..."
  system "sudo chmod -R 777 /var/lib/gems"
  sleep 3
  system "clear"
else
end
system "gem install csv"
system "gem install ruby-notify-send"
system "gem install colorize"
system "sudo gem install coinbase"
system "clear"
if File.exist?('prefs.txt')
  system "rm ./prefs.txt"
else end

system "cat ./changelog.txt"
version = %x[cat ./version-check]
installed = %x[cat ./installed-version]
old = %x[cat ./old-version]
puts "uninstalled : #{old.to_s}"
puts "installed : #{installed.to_s}"
puts "online : #{version.to_s}"
puts "All Done, Goodbye!"
