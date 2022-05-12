#!/usr/bin/env ruby
system "clear"
$loading = 0
Thread.new {until $loading == 1 do
  print "Updating Crypto Price Database"
  $run = 1
  until $run == 6 do
    print "."
    $run += 1
    sleep 0.3
  end
  print "\n"
  system "clear"
end}
$cryptopricedata = Array.new(15)
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
pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-usd/spot | awk -F '"' '{print $14}']
pricemln = %x[curl -s https://api.coinbase.com/v2/prices/mln-usd/spot | awk -F '"' '{print $14}']
priceeth2 = %x[curl -s https://api.coinbase.com/v2/prices/eth2-usd/spot | awk -F '"' '{print $14}']
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
$pricegrt_f = pricegrt.to_f
$pricemln_f = pricemln.to_f
$priceeth2_f = priceeth2.to_f
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
$cryptopricedata[12] = "#{$pricegrt_f}"
$cryptopricedata[13] = "#{$pricemln_f}"
$cryptopricedata[14] = "#{$priceeth2_f}"
$serialized_array = Marshal.dump($cryptopricedata)
$loading = 1
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
system "clear"
system "cat ./changelog.txt"
version = %x[cat ./version-check]
installed = %x[cat ./installed-version]
old = %x[cat ./old-version]
puts "uninstalled : #{old.to_s}"
puts "installed : #{installed.to_s}"
puts "online : #{version.to_s}"
puts "All Done, Goodbye!"
