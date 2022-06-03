#!/usr/bin/env ruby
require 'coinbase/wallet'
#prices are retrieved here and stored so output isn't choppy
class Core
  def prices
  $price = Array.new(17)
  $price[0] = $bitcoin.price
  time = Time.new
  $btct = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[1] = $bitcoincash.price
  time = Time.new
  $bcht = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[2] = $litecoin.price
  time = Time.new
  $ltct = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[3] = $dogecoin.price
  time = Time.new
  $doget = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[4] = $stellarlumans.price
  time = Time.new
  $xlmt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[5] = $basicattentiontoken.price
  time = Time.new
  $batt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[6] = $ethereum.price
  time = Time.new
  $etht = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[7] = $solana.price
  time = Time.new
  $solt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[8] = $cardano.price
  time = Time.new
  $adat = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[9] = $loopring.price
  time = Time.new
  $lrct = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[10] = $amp.price
  time = Time.new
  $ampt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[11] = $skale.price
  time = Time.new
  $sklt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[12] = $thegraph.price
  time = Time.new
  $grtt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[13] = $enzyme.price
  time = Time.new
  $mlnt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[14] = $shibainu.price
  time = Time.new
  $shibt = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[15] = $ethereum2.price
  time = Time.new
  $eth2t = time.strftime("%Y-%m-%d-%H:%M:%S")
  $price[16] = $polkadot.price
  time = Time.new
  $dott = time.strftime("%Y-%m-%d-%H:%M:%S")

end
saved = File.exist?('prefs.txt')
if saved.to_s == "true"
  $prefs_file = ("prefs.txt")
  prefs = File.open("#{$prefs_file}")
  prefs_data = prefs.readlines.map(&:chomp)
  $currencyraw = prefs_data[1]
  $noti = $notiraw.to_s
  $sourcecur = $currencyraw.to_i
  if $sourcecur == 1
$currency_code = 'USD'
  elsif $sourcecur == 2
$currency_code = 'EUR'
  else
$currency_code = 'RUB'
  end
else
until $sourcecur == 1 || $sourcecur == 2 || $sourcecur == 3 do
  puts "what is source Currency? (1 for USD, 2 for EUR, 3 for RUB)"
  $sourcecur = gets.to_i
  if $sourcecur == 1
$currency_code = 'USD'
  elsif $sourcecur == 2
$currency_code = 'EUR'
  else
$currency_code = 'RUB'
  end
  mkpref = "z"
  until mkpref == "y" || mkpref =="n" do
    puts "would you like to save your answers? (y/n)"
    mkpref = gets.chomp
  end
  if mkpref.to_s == "y"
    File.open("prefs.txt", 'a+') {|f| f.write("Currency? \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("#{$sourcecur.to_i} \n") }
  else
  end
end
end
if File.exist?('keys.txt')
else
  system "clear"
  puts "==========ERROR==========".colorize(:white).on_red.underline.blink
  puts "please go to coinbase.com and generate your API keys to run this program"
  puts "exiting program..."
  system "killall ruby"
end
end
#Creating Class for crypto prcies
#coin is coin type
#own is amount of crypto owned
#spen is how fiat was spent to aquire crypto
#value is the value of the crypto holdings
#last is a holding spot for last price update
#old is the 2nd holding spot for the last price
class Crypto
  attr_accessor :coin, :own, :spen, :value, :last, :old
  def initialize(c, o, s)
    @coin = c
    @own = o
    @spen = s
  end

  def price
    key = File.open("keys.txt")
    key_data = key.readlines.map(&:chomp)
    api = key_data[0]
    secret = key_data[1]
    client = Coinbase::Wallet::Client.new(api_key: "#{api.to_s}",api_secret: "#{secret.to_s}")
    price = client.spot_price({currency_pair: "#{@coin}-#{$currency_code}"})
    @old = last.to_f
    @value = (own.to_f * price.amount.to_f.round(3))
    @last = price.amount.to_f.round(3)
    "#{price.amount.to_f.round(3)}"
  end
  def owns
    "#{own}"
  end
  def spent
    "#{spen}"
  end
  def breakeven
    $breakeven = (spen.to_f / own.to_f)
    "#{$breakeven.to_f.round(3)}"
  end
  def earnings
    $earnins = ((spen.to_f - value.to_f) * -1)
    "#{earnins.to_f.round(3)}"
  end
  def profits
    rawprof = (value.to_f - ($breakeven.to_f * own.to_f))
    $value = rawprof.round(2)
    "#{$value}"
  end
  def change
    pchange = (((last.to_f - old.to_f) / old.to_f) * 100.0)
    "#{pchange.to_f.round(3)}"
  end
  def trending
    pchange = (((last.to_f - old.to_f) / old.to_f) * 100.0)
    pcr = pchange.round(3)
    if last.to_f > old.to_f
      puts "trending up #{pcr.to_s}%".colorize(:black).on_green.blink
    elsif last.to_f < old.to_f
      puts "trending down #{pcr.to_s}%".colorize(:white).on_red.blink
    else
      puts "has not changed since last update".colorize(:black).on_white
    end
  end
end
#Get info from data file and initilize coins in math
class Loading
  def initialize(dataset)
    @dataset = dataset
  end
  def input
    file = File.open("#{@dataset}", "r")
    file_data = file.readlines.map(&:chomp)
    ownbtc = file_data[1]
    spentbtc = file_data[3]
    $bitcoin = Crypto.new('btc', "#{ownbtc}", "#{spentbtc}")
    ownbch = file_data[5]
    spentbch = file_data[7]
    $bitcoincash = Crypto.new('bch', "#{ownbch}", "#{spentbch}")
    ownltc = file_data[9]
    spentltc = file_data[11]
    $litecoin = Crypto.new('ltc', "#{ownltc}", "#{spentltc}")
    owndoge = file_data[13]
    spentdoge = file_data[15]
    $dogecoin = Crypto.new('doge', "#{owndoge}", "#{spentdoge}")
    ownxlm = file_data[17]
    spentxlm = file_data[19]
    $stellarlumans = Crypto.new('xlm', "#{ownxlm}", "#{spentxlm}")
    ownbat = file_data[21]
    spentbat = file_data[23]
    $basicattentiontoken = Crypto.new('bat', "#{ownbat}", "#{spentbat}")
    owneth = file_data[25]
    spenteth = file_data[27]
    $ethereum = Crypto.new('eth', "#{owneth}", "#{spenteth}")
    ownsol = file_data[29]
    spentsol = file_data[31]
    $solana = Crypto.new('sol', "#{ownsol}", "#{spentsol}")
    ownada = file_data[33]
    spentada = file_data[35]
    $cardano = Crypto.new('ada', "#{ownada}", "#{spentada}")
    ownlrc = file_data[37]
    spentlrc = file_data[39]
    $loopring = Crypto.new('lrc', "#{ownlrc}", "#{spentlrc}")
    ownamp = file_data[41]
    spentamp = file_data[43]
    $amp = Crypto.new('amp', "#{ownamp}", "#{spentamp}")
    ownskl = file_data[45]
    spentskl = file_data[47]
    $skale = Crypto.new('skl', "#{ownskl}", "#{spentskl}")
    owngrt = file_data[49]
    spentgrt = file_data[51]
    $thegraph = Crypto.new('grt', "#{owngrt}", "#{spentgrt}")
    ownmln = file_data[53]
    spentmln = file_data[55]
    $enzyme = Crypto.new('mln', "#{ownmln}", "#{spentmln}")
    owneth2 = file_data[57]
    spenteth2 = file_data[59]
    $ethereum2 = Crypto.new('eth2', "#{owneth2}", "#{spenteth2}")
    ownshib = file_data[61]
    spentshib = file_data[63]
    $shibainu = Crypto.new('shib', "#{ownshib}", "#{spentshib}")
    owndot = file_data[65]
    spentdot = file_data[67]
    $polkadot = Crypto.new('dot', "#{owndot}", "#{spentdot}")
    $cryptopricedata = Array.new(17)
    $version = %x[cat ./installed-version]
    file.close unless file.closed?
  end
end
