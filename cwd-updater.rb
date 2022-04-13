#!/usr/bin/env ruby
system "rm ./version-check"
system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/version-check"
version = %x[cat ./version-check]
installed = %x[cat ./installed-version]
time = Time.new
$ltc = time.strftime("%Y-%m-%d-%H:%M:%S")
puts "installed : #{installed.to_s}"
puts "online : #{version.to_s}"
puts "would you like to update? (y/n)"
$update = gets.chomp
  if $update == "y"
    puts "updating..."
    system "rm ./cryptowatchdash.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptowatchdash.rb"
    system "rm ./old-version"
    system "cp ./installed-version ./old-version"
    system "rm ./installed-version"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/installed-version"
    system "rm ./cwd-updater.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cwd-updater.rb"
    system "chmod +x ./cwd-updater.rb"
    system "chmod +x ./cryptowatchdash*"
    system "mkdir ./backup"
    system "mv ./*.csv ./#{$ltc}-logbackup.csv"
    system "mv ./*.csv ./backup"
    system "mv ./cryptodata.txt ./#{$ltc}-cryptodata.txt"
    system "mv ./*-cryptodata.txt ./backup"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptodata.txt"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/cryptodata.txt-logging.csv"
    system "gedit ./cryptodata.txt ./backup/#{$ltc}-cryptodata.txt"
    system "rm ./changelog.txt"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/changelog.txt"
    system "rm ./after-effects.rb"
    system "wget https://raw.githubusercontent.com/bigc0127/cryptowatchdash/main/after-effects.rb"
    system "chmod +x ./after-effects.rb"
    system "./after-effects.rb"
    else
      puts "exiting..."
end
