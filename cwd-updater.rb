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
    puts "updating..."
    system "rm ./cryptowatchdash.rb"
    system "rm ./cryptowatchdashlight.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptowatchdash.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptowatchdashlight.rb"
    system "rm ./installed-version"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/installed-version"
    system "rm ./cwd-updater.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cwd-updater.rb"
    system "chmod +x ./cwd-updater.rb"
    system "chmod +x ./cryptowatchdash*"
    version = %x[cat ./version-check]
    installed = %x[cat ./installed-version]
    puts "installed : #{version.to_s}"
    puts "online : #{installed.to_s}"
    puts "All Done, Goodbye!"
    else
      puts "exiting..."
end
