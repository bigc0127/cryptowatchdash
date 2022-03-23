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
    $cryptopricedata = Array.new(11)
    pricebtc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBTCUSD | awk -F "," '{print $7}']
    pricebch = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBCHN:USD | awk -F "," '{print $7}']
    priceltc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tLTCUSD | awk -F "," '{print $7}']
    pricedoge = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tDOGE:USD | awk -F "," '{print $7}']
    pricexlm = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tXLMUSD | awk -F "," '{print $7}']
    pricebat = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBATUSD | awk -F "," '{print $7}']
    priceeth = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tETHUSD | awk -F "," '{print $7}']
    pricesol = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tSOLUSD | awk -F "," '{print $7}']
    priceada = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tADAUSD | awk -F "," '{print $7}']
    pricelrc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tLRCUSD | awk -F "," '{print $7}']
    priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-usd/spot | awk -F '"' '{print $14}']
    priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-usd/spot | awk -F '"' '{print $14}']
    $pricebtc_f = pricebtc.to_f
    $pricebch_f = pricebch.to_f
    $priceltc_f = priceltc.to_f
    $pricedoge_f = pricedoge.to_f
    $pricexlm_f = pricexlm.to_f
    $pricebat_f = pricebat.to_f
    $priceeth_f = priceeth.to_f
    $pricesol_f = pricesol.to_f
    $priceada_f = priceada.to_f
    $pricelrc_f = pricelrc.to_f
    $priceamp_f = priceamp.to_f
    $priceskl_f = priceskl.to_f
    $cryptopricedata = Marshal.load File.read('cryptopricedata.txt')
    $cryptopricedata[0] = "#{$pricebtc_f}"
    $cryptopricedata[1] = "#{$pricebch_f}"
    $cryptopricedata[2] = "#{$priceltc_f}"
    $cryptopricedata[3] = "#{$pricedoge_f}"
    $cryptopricedata[4] = "#{$pricexlm_f}"
    $cryptopricedata[5] = "#{$pricebat_f}"
    $cryptopricedata[6] = "#{$priceeth_f}"
    $cryptopricedata[7] = "#{$pricesol_f}"
    $cryptopricedata[8] = "#{$priceada_f}"
    $cryptopricedata[9] = "#{$pricelrc_f}"
    $cryptopricedata[10] = "#{$priceamp_f}"
    $cryptopricedata[11] = "#{$priceskl_f}"
    $serialized_array = Marshal.dump($cryptopricedata)
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
    system "./after-effects.rb"
    else
      puts "exiting..."
end
