#!/usr/bin/env ruby
system "rm ./version-check"
system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/version-check"
version = %x[cat ./version-check]
installed = %x[cat ./installed-version]
puts "installed : #{version.to_s}"
puts "online : #{installed.to_s}"
puts "would you like to update? (y/n)"
$update = gets.chomp
  if $update == "y"
    puts "partial update of cryptowatchdash"
    system "rm ./cryptowatchdash.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptowatchdash.rb"
    system "rm ./installed-version"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/installed-version"
    version = %x[cat ./version-check]
    installed = %x[cat ./installed-version]
    puts "installed : #{version.to_s}"
    puts "online : #{installed.to_s}"
    puts "All Done, Goodbye!"
    else
      puts "exiting..."
end
