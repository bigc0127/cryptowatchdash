#!/usr/bin/env ruby
require 'colorize'
require 'csv'
require 'notify-send'
def setup
  $time = 10
  $dataset = "./cryptodata.txt"
  file = File.open("#{$dataset}", "r")
  file_data = file.readlines.map(&:chomp)
  $ownbtcraw = file_data[1]
  $ownbtc = $ownbtcraw.to_f
  $oldpricebtc = 1
  $oldmoneybtc = 0
  $spentbtcraw = file_data[3]
  $spentbtc = $spentbtcraw.to_f
  $filetest = file_data[3]

  $ownbchraw = file_data[5]
  $ownbch = $ownbchraw.to_f
  $oldpricebch = 1
  $oldmoneybch = 0
  $spentbchraw = file_data[7]
  $spentbch = $spentbchraw.to_f

  $ownltcraw = file_data[9]
  $ownltc = $ownltcraw.to_f
  $oldpriceltc = 1
  $oldmoneyltc = 0
  $spentltcraw = file_data[11]
  $spentltc = $spentltcraw.to_f

  $owndogeraw = file_data[13]
  $owndoge = $owndogeraw.to_f
  $oldpricedoge = 1
  $oldmoneydoge = 0
  $spentdogeraw = file_data[15]
  $spentdoge = $spentdogeraw.to_f

  $ownxlmraw = file_data[17]
  $ownxlm = $ownxlmraw.to_f
  $oldpricexlm = 1
  $oldmoneyxlm = 0
  $spentxlmraw = file_data[19]
  $spentxlm = $spentxlmraw.to_f

  $ownbatraw = file_data[21]
  $ownbat = $ownbatraw.to_f
  $oldpricebat = 1
  $oldmoneybat = 0
  $spentbatraw = file_data[23]
  $spentbat = $spentbatraw.to_f

  $ownethraw = file_data[25]
  $owneth = $ownethraw.to_f
  $oldpriceeth = 1
  $oldmoneyeth = 0
  $spentethraw = file_data[27]
  $spenteth = $spentethraw.to_f

  $ownsolraw = file_data[29]
  $ownsol = $ownsolraw.to_f
  $oldpricesol = 1
  $oldmoneysol = 0
  $spentsolraw = file_data[31]
  $spentsol = $spentsolraw.to_f

  $ownadaraw = file_data[33]
  $ownada = $ownadaraw.to_f
  $oldpriceada = 1
  $oldmoneyada = 0
  $spentadaraw = file_data[35]
  $spentada = $spentadaraw.to_f

  $ownlrcraw = file_data[37]
  $ownlrc = $ownlrcraw.to_f
  $oldpricelrc = 1
  $oldmoneylrc = 0
  $spentlrcraw = file_data[39]
  $spentlrc = $spentlrcraw.to_f

  $ownampraw = file_data[41]
  $ownamp = $ownampraw.to_f
  $oldpriceamp = 1
  $oldmoneyamp = 0
  $spentampraw = file_data[43]
  $spentamp = $spentampraw.to_f

  $ownsklraw = file_data[45]
  $ownskl = $ownsklraw.to_f
  $oldpriceskl = 1
  $oldmoneyskl = 0
  $spentsklraw = file_data[47]
  $spentskl = $spentsklraw.to_f

  $owngrtraw = file_data[49]
  $owngrt = $owngrtraw.to_f
  $oldpricegrt = 1
  $oldmoneygrt = 0
  $spentgrtraw = file_data[51]
  $spentgrt = $spentgrtraw.to_f

  $ownmlnraw = file_data[53]
  $ownmln = $ownmlnraw.to_f
  $oldpricemln = 1
  $oldmoneymln = 0
  $spentmlnraw = file_data[55]
  $spentmln = $spentmlnraw.to_f

  $owneth2raw = file_data[57]
  $owneth2 = $owneth2raw.to_f
  $oldpriceeth2 = 1
  $oldmoneyeth2 = 0
  $spenteth2raw = file_data[59]
  $spenteth2 = $spenteth2raw.to_f

  $ownshibraw = file_data[61]
  $ownshib = $ownshibraw.to_f
  $oldpriceshib = 1
  $oldmoneyshib = 0
  $spentshibraw = file_data[63]
  $spentshib = $spentshibraw.to_f

  $cryptopricedata = Array.new(16)
  $version = %x[cat ./installed-version]
  file.close unless file.closed?

end
def currency
  if $currency == 3
      $pricebtc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBTCUSD | awk -F "," '{print $7}']
      $pricebch = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBCHN:USD | awk -F "," '{print $7}']
      $priceltc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tLTCUSD | awk -F "," '{print $7}']
      $pricedoge = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tDOGE:USD | awk -F "," '{print $7}']
      $pricexlm = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tXLMUSD | awk -F "," '{print $7}']
      $pricebat = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBATUSD | awk -F "," '{print $7}']
      $priceeth = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tETHUSD | awk -F "," '{print $7}']
      $pricesol = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tSOLUSD | awk -F "," '{print $7}']
      $priceada = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tADAUSD | awk -F "," '{print $7}']
      $pricelrc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tLRCUSD | awk -F "," '{print $7}']
      $priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-usd/spot | awk -F '"' '{print $14}']
      $priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-usd/spot | awk -F '"' '{print $14}']
      $pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-usd/spot | awk -F '"' '{print $14}']
      $pricemln = %x[curl -s https://api.coinbase.com/v2/prices/mln-usd/spot | awk -F '"' '{print $14}']
      $priceeth2 = %x[curl -s https://api.coinbase.com/v2/prices/eth2-usd/spot | awk -F '"' '{print $14}']
      $priceshib = %x[curl -s https://api.coinbase.com/v2/prices/shib-usd/spot | awk -F '"' '{print $14}']
    elsif $currency == 2
      $pricebtc = %x[curl -s https://api.coinbase.com/v2/prices/btc-rub/spot | awk -F '"' '{print $14}']
      $pricebch = %x[curl -s https://api.coinbase.com/v2/prices/bch-rub/spot | awk -F '"' '{print $14}']
      $priceltc = %x[curl -s https://api.coinbase.com/v2/prices/ltc-rub/spot | awk -F '"' '{print $14}']
      $pricedoge = %x[curl -s https://api.coinbase.com/v2/prices/doge-rub/spot | awk -F '"' '{print $14}']
      $pricexlm = %x[curl -s https://api.coinbase.com/v2/prices/xlm-rub/spot | awk -F '"' '{print $14}']
      $pricebat = %x[curl -s https://api.coinbase.com/v2/prices/bat-rub/spot | awk -F '"' '{print $14}']
      $priceeth = %x[curl -s https://api.coinbase.com/v2/prices/eth-rub/spot | awk -F '"' '{print $14}']
      $pricesol = %x[curl -s https://api.coinbase.com/v2/prices/sol-rub/spot | awk -F '"' '{print $14}']
      $priceada = %x[curl -s https://api.coinbase.com/v2/prices/ada-rub/spot | awk -F '"' '{print $14}']
      $pricelrc = %x[curl -s https://api.coinbase.com/v2/prices/lrc-rub/spot | awk -F '"' '{print $14}']
      $priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-rub/spot | awk -F '"' '{print $14}']
      $priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-rub/spot | awk -F '"' '{print $14}']
      $pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-rub/spot | awk -F '"' '{print $14}']
      $pricemln = %x[curl -s https://api.coinbase.com/v2/prices/mln-rub/spot | awk -F '"' '{print $14}']
      $priceeth2 = %x[curl -s https://api.coinbase.com/v2/prices/eth2-rub/spot | awk -F '"' '{print $14}']
      $priceshib = %x[curl -s https://api.coinbase.com/v2/prices/shib-rub/spot | awk -F '"' '{print $14}']
    elsif $currency == 1
      $pricebtc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBTCEUR | awk -F "," '{print $7}']
      $pricebch = %x[curl -s https://api.coinbase.com/v2/prices/bch-eur/spot | awk -F '"' '{print $14}']
      $priceltc = %x[curl -s https://api.coinbase.com/v2/prices/ltc-eur/spot | awk -F '"' '{print $14}']
      $pricedoge = %x[curl -s https://api.coinbase.com/v2/prices/doge-eur/spot | awk -F '"' '{print $14}']
      $pricexlm = %x[curl -s https://api.coinbase.com/v2/prices/xlm-eur/spot | awk -F '"' '{print $14}']
      $pricebat = %x[curl -s https://api.coinbase.com/v2/prices/bat-eur/spot | awk -F '"' '{print $14}']
      $priceeth = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tETHEUR | awk -F "," '{print $7}']
      $pricesol = %x[curl -s https://api.coinbase.com/v2/prices/sol-eur/spot | awk -F '"' '{print $14}']
      $priceada = %x[curl -s https://api.coinbase.com/v2/prices/ada-eur/spot | awk -F '"' '{print $14}']
      $pricelrc = %x[curl -s https://api.coinbase.com/v2/prices/lrc-eur/spot | awk -F '"' '{print $14}']
      $priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-eur/spot | awk -F '"' '{print $14}']
      $priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-eur/spot | awk -F '"' '{print $14}']
      $pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-eur/spot | awk -F '"' '{print $14}']
      $pricemln = %x[curl -s https://api.coinbase.com/v2/prices/mln-eur/spot | awk -F '"' '{print $14}']
      $priceeth2 = %x[curl -s https://api.coinbase.com/v2/prices/eth2-eur/spot | awk -F '"' '{print $14}']
      $priceshib = %x[curl -s https://api.coinbase.com/v2/prices/shib-eur/spot | awk -F '"' '{print $14}']
    else
      puts "incorrect currency selection useing last saved prices and changing to USD"
      $currency == 3
    end
    $cryptopricedata = Marshal.load File.read('cryptopricedata.txt')
end
def convert
  if $currency == 3
    $moneysymbol = "$"
  elsif $currency == 2
    $moneysymbol = "₽"
  else
    $moneysymbol = "€"
  end
  if $currency == 3 && $sourcecur == 1
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/eur/usd.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  elsif $currency == 2 && $sourcecur == 1
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/eur/rub.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  elsif $currency == 1 && $sourcecur == 1
    $curconv = 1.to_f
  elsif $currency == 3 && $sourcecur == 2
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/rub/usd.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  elsif $currency == 2 && $sourcecur == 2
    $curconv = 1.to_f
  elsif $currency == 1 && $sourcecur == 2
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/rub/eur.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  elsif $currency == 3 && $sourcecur == 3
    $curconv = 1.to_f
  elsif $currency == 2 && $sourcecur == 3
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/usd/rub.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  elsif $currency == 1 && $sourcecur == 3
    $curconv = %x[curl -s https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/usd/eur.min.json | awk -F ":" '{print $3}' | tr -d {}]
    $curconv = $curconv.to_f
  else
    puts "ERROR DEFAULTING TO USD"
  end
  $spentbtc = ($spentbtcraw.to_f * $curconv.to_f)
  $spentbch = ($spentbchraw.to_f * $curconv.to_f)
  $spentltc = ($spentltcraw.to_f * $curconv.to_f)
  $spentdoge = ($spentdogeraw.to_f * $curconv.to_f)
  $spentxlm = ($spentxlmraw.to_f * $curconv.to_f)
  $spentbat = ($spentbatraw.to_f * $curconv.to_f)
  $spenteth = ($spentethraw.to_f * $curconv.to_f)
  $spenteth = ($spentethraw.to_f * $curconv.to_f)
  $spentsol = ($spentsolraw.to_f * $curconv.to_f)
  $spentlrc = ($spentlrcraw.to_f * $curconv.to_f)
  $spentada = ($spentadaraw.to_f * $curconv.to_f)
  $spentamp = ($spentampraw.to_f * $curconv.to_f)
  $spentskl = ($spentsklraw.to_f * $curconv.to_f)
  $spentgrt = ($spentgrtraw.to_f * $curconv.to_f)
  $spentmln = ($spentmlnraw.to_f * $curconv.to_f)
  $spenteth2 = ($spenteth2raw.to_f * $curconv.to_f)
  $spentshib = ($spentshibraw.to_f * $curconv.to_f)
  $totalspent = ($spentbtc + $spentbch + $spentltc + $spentdoge + $spentxlm + $spentbat + $spenteth + $spentsol + $spentada + $spentlrc + $spentamp + $spentskl + $spentgrt + $spentmln + $spenteth2 + $spentshib)
end
def logging
  CSV.open("#{$dataset}-logging.csv", "ab") do |csv|
  csv << ["#{$ltc}","#{$currency}","#{$pricebtc_f}","#{$amountbtc_r}","#{$btcpchange_r}","#{$pricebch_f}","#{$amountbch_r}","#{$bchpchange_r}","#{$priceltc_f}","#{$amountltc_r}","#{$ltcpchange_r}","#{$pricedoge_f}","#{$amountdoge_r}","#{$dogepchange_r}","#{$pricexlm_f}","#{$amountxlm_r}","#{$xlmpchange_r}","#{$pricebat_f}","#{$amountbat_r}","#{$batpchange_r}","#{$priceeth_f}","#{$amounteth_r}","#{$ethpchange_r}","#{$pricesol_f}","#{$amountsol_r}","#{$solpchange_r}","#{$priceada_f}","#{$amountada_r}","#{$adapchange_r}","#{$pricelrc_f}","#{$amountlrc_r}","#{$lrcpchange_r}","#{$priceamp_f}","#{$amountamp_r}","#{$amppchange_r}","#{$priceskl_f}","#{$amountskl_r}","#{$sklpchange_r}","#{$pricegrt_f}","#{$amountgrt_r}","#{$grtpchange_r}","#{$pricemln_f}","#{$amountmln_r}","#{$mlnpchange_r}","#{$priceeth2_f}","#{$amounteth2_r}","#{$eth2pchange_r}","#{$priceshib_f}","#{$amountshib_r}","#{$shibpchange_r}","#{$totalearnins}","#{$precentage}%"]
end
end
def notifications
  if $n == 10
    NotifySend.send "CryptoWatchDash","Total earnins #{$totalearnins.to_s} Total H#{$moneysymbol} #{$totalvalue} H#{$moneysymbol} % Change (#{$precentage}%)","info",500
    $n = 0
  else
end
end
##MATH
def btcmath
  $pricebtc_f = $pricebtc.to_f
  $pricebtc_r = $pricebtc_f.round(3)
  amountbtc = $ownbtc * $pricebtc_f
  $amountbtc_r = amountbtc.round(2)
  breakevenbtc = ($spentbtc / $ownbtc)
  $breakevenbtc_r = breakevenbtc.round(2)
  earninsbtc = (($spentbtc - amountbtc) * -1)
  changebtc = ($oldmoneybtc - earninsbtc)
  $earninsbtc_r = earninsbtc.round(2)
  $oldmoneybtc = earninsbtc
  $oldpricebtc = $cryptopricedata[0]
  $oldpricebtc = $oldpricebtc.to_f
  btcpchange = ((($pricebtc_f - $oldpricebtc.to_f) / $oldpricebtc.to_f) * 100.0)
  $btcpchange_r = btcpchange.round(2)
  $cryptopricedata[0] = "#{$pricebtc_f}"
end
def bchmath
  $pricebch_f = $pricebch.to_f
  $pricebch_r = $pricebch_f.round(3)
  amountbch = $ownbch * $pricebch_f
  $amountbch_r = amountbch.round(2)
  breakevenbch = ($spentbch / $ownbch)
  $breakevenbch_r = breakevenbch.round(2)
  earninsbch = (($spentbch - amountbch) * -1)
  changebch = ($oldmoneybch - earninsbch)
  $earninsbch_r = earninsbch.round(2)
  $oldmoneybch = earninsbch
  $oldpricebch = $cryptopricedata[1]
  $oldpricebch = $oldpricebch.to_f
  bchpchange = ((($pricebch_f - $oldpricebch.to_f) / $oldpricebch.to_f) * 100.0)
  $bchpchange_r = bchpchange.round(2)
  $cryptopricedata[1] = "#{$pricebch_f}"
end
def ltcmath
  $priceltc_f = $priceltc.to_f
  $priceltc_r = $priceltc_f.round(3)
  amountltc = $ownltc * $priceltc_f
  $amountltc_r = amountltc.round(2)
  breakevenbtc = ($spentbtc / $ownbtc)
  breakevenbch = ($spentbch / $ownbch)
  breakevenltc = ($spentltc / $ownltc)
  $breakevenltc_r = breakevenltc.round(2)
  earninsltc = (($spentltc - amountltc) * -1)
  changeltc = ($oldmoneyltc - earninsltc)
  $earninsltc_r = earninsltc.round(2)
  $oldmoneyltc = earninsltc
  $oldpriceltc = $cryptopricedata[2]
  $oldpriceltc = $oldpriceltc.to_f
  ltcpchange = ((($priceltc_f - $oldpriceltc.to_f) / $oldpriceltc.to_f) * 100.0)
  $ltcpchange_r = ltcpchange.round(2)
  $cryptopricedata[2] = "#{$priceltc_f}"
end
def dogemath
  $pricedoge_f = $pricedoge.to_f
  $pricedoge_r = $pricedoge_f.round(4)
  amountdoge = $owndoge * $pricedoge_f
  $amountdoge_r = amountdoge.round(2)
  breakevendoge = ($spentdoge / $owndoge)
  $breakevendoge_r = breakevendoge.round(3)
  earninsdoge = (($spentdoge - amountdoge) * -1)
  changedoge = ($oldmoneydoge - earninsdoge)
  $earninsdoge_r = earninsdoge.round(2)
  $oldmoneydoge = earninsdoge
  $oldpricedoge = $cryptopricedata[3]
  $oldpricedoge = $oldpricedoge.to_f
  dogepchange = ((($pricedoge_f - $oldpricedoge.to_f) / $oldpricedoge.to_f) * 100.0)
  $dogepchange_r = dogepchange.round(2)
  $cryptopricedata[3] = "#{$pricedoge_f}"
end
def xlmmath
  $pricexlm_f = $pricexlm.to_f
  $pricexlm_r = $pricexlm_f.round(3)
  amountxlm = $ownxlm * $pricexlm_f
  $amountxlm_r = amountxlm.round(2)
  breakevenxlm = ($spentxlm / $ownxlm)
  $breakevenxlm_r = breakevenxlm.round(2)
  earninsxlm = (($spentxlm - amountxlm) * -1)
  changexlm = ($oldmoneyxlm - earninsxlm)
  $earninsxlm_r = earninsxlm.round(2)
  $oldmoneyxlm = earninsxlm
  $oldpricexlm = $cryptopricedata[4]
  $oldpricexlm = $oldpricexlm.to_f
  xlmchange = ((($pricexlm_f - $oldpricexlm.to_f) / $oldpricexlm.to_f) * 100.0)
  $xlmpchange_r = xlmchange.round(2)
  $cryptopricedata[4] = "#{$pricexlm_f}"
end
def batmath
  $pricebat_f = $pricebat.to_f
  $pricebat_r = $pricebat_f.round(3)
  amountbat = $ownbat * $pricebat_f
  $amountbat_r = amountbat.round(2)
  breakevenbat = ($spentbat / $ownbat)
  $breakevenbat_r = breakevenbat.round(2)
  earninsbat = (($spentbat - amountbat) * -1)
  changebat = ($oldmoneybat - earninsbat)
  $earninsbat_r = earninsbat.round(2)
  $oldmoneybat = earninsbat
  $oldpricebat = $cryptopricedata[5]
  $oldpricebat = $oldpricebat.to_f
  batpchnage = ((($pricebat_f - $oldpricebat.to_f) / $oldpricebat.to_f) * 100.0)
  $batpchange_r = batpchnage.round(2)
  $cryptopricedata[5] = "#{$pricebat_f}"
end
def ethmath
  $priceeth_f = $priceeth.to_f
  $priceeth_r = $priceeth_f.round(3)
  amounteth = $owneth * $priceeth_f
  $amounteth_r = amounteth.round(2)
  breakeveneth = ($spenteth / $owneth)
  $breakeveneth_r = breakeveneth.round(2)
  earninseth = (($spenteth - amounteth) * -1)
  changeeth = ($oldmoneyeth - earninseth)
  $earninseth_r = earninseth.round(2)
  $oldmoneyeth = earninseth
  $oldpriceeth = $cryptopricedata[6]
  $oldpriceeth = $oldpriceeth.to_f
  ethpchange = ((($priceeth_f - $oldpriceeth.to_f) / $oldpriceeth.to_f) * 100.0)
  $ethpchange_r = ethpchange.round(2)
  $cryptopricedata[6] = "#{$priceeth_f}"
end
def solmath
  $pricesol_f = $pricesol.to_f
  $pricesol_r = $pricesol_f.round(3)
  amountsol = $ownsol * $pricesol_f
  $amountsol_r = amountsol.round(2)
  breakevensol = ($spentsol / $ownsol)
  $breakevensol_r = breakevensol.round(2)
  earninssol = (($spentsol - amountsol) * -1)
  changesol = ($oldmoneysol - earninssol)
  $earninssol_r = earninssol.round(2)
  $oldmoneysol = earninssol
  $oldpricesol = $cryptopricedata[7]
  $oldpricesol = $oldpricesol.to_f
  solpchange = ((($pricesol_f - $oldpricesol.to_f) / $oldpricesol.to_f) * 100.0)
  $solpchange_r = solpchange.round(2)
  $cryptopricedata[7] = "#{$pricesol_f}"
end
def adamath
  $priceada_f = $priceada.to_f
  $priceada_r = $priceada_f.round(3)
  amountada = $ownada * $priceada_f
  $amountada_r = amountada.round(2)
  breakevenada = ($spentada / $ownada)
  $breakevenada_r = breakevenada.round(2)
  earninsada = (($spentada - amountada) * -1)
  changeada = ($oldmoneyada - earninsada)
  $earninsada_r = earninsada.round(2)
  $oldmoneyada = earninsada
  $oldpriceada = $cryptopricedata[8]
  $oldpriceada = $oldpriceada.to_f
  adapchange = ((($priceada_f - $oldpriceada.to_f) / $oldpriceada.to_f) * 100.0)
  $adapchange_r = adapchange.round(2)
  $cryptopricedata[8] = "#{$priceada_f}"
end
def lrcmath
  $pricelrc_f = $pricelrc.to_f
  $pricelrc_r = $pricelrc_f.round(3)
  amountlrc = $ownlrc * $pricelrc_f
  $amountlrc_r = amountlrc.round(2)
  breakevenlrc = ($spentlrc / $ownlrc)
  $breakevenlrc_r = breakevenlrc.round(2)
  earninslrc = (($spentlrc - amountlrc) * -1)
  changelrc = ($oldmoneylrc - earninslrc)
  $earninslrc_r = earninslrc.round(2)
  $oldmoneylrc = earninslrc
  $oldpricelrc = $cryptopricedata[9]
  $oldpricelrc = $oldpricelrc.to_f
  lrcpchange = ((($pricelrc_f - $oldpricelrc.to_f) / $oldpricelrc.to_f) * 100.0)
  $lrcpchange_r = lrcpchange.round(2)
  $cryptopricedata[9] = "#{$pricelrc_f}"
end
def ampmath
  $priceamp_f = $priceamp.to_f
  $priceamp_r = $priceamp_f.round(4)
  amountamp = $ownamp * $priceamp_f
  $amountamp_r = amountamp.round(2)
  breakevenamp = ($spentamp / $ownamp)
  $breakevenamp_r = breakevenamp.round(3)
  earninsamp = (($spentamp - amountamp) * -1)
  changeamp = ($oldmoneyamp - earninsamp)
  $earninsamp_r = earninsamp.round(2)
  $oldmoneyamp = earninsamp
  $oldpriceamp = $cryptopricedata[10]
  $oldpriceamp = $oldpriceamp.to_f
  amppchange = ((($priceamp_f - $oldpriceamp.to_f) / $oldpriceamp.to_f) * 100.0)
  $amppchange_r = amppchange.round(2)
  $cryptopricedata[10] = "#{$priceamp_f}"
end
def sklmath
  $priceskl_f = $priceskl.to_f
  $priceskl_r = $priceskl_f.round(4)
  amountskl = $ownskl * $priceskl_f
  $amountskl_r = amountskl.round(2)
  breakevenskl = ($spentskl / $ownskl)
  $breakevenskl_r = breakevenskl.round(3)
  earninsskl = (($spentskl - amountskl) * -1)
  changeskl = ($oldmoneyskl - earninsskl)
  $earninsskl_r = earninsskl.round(2)
  $oldmoneyskl = earninsskl
  $oldpriceskl = $cryptopricedata[11]
  $oldpriceskl = $oldpriceskl.to_f
  sklpchange = ((($priceskl_f - $oldpriceskl.to_f) / $oldpriceskl.to_f) * 100.0)
  $sklpchange_r = sklpchange.round(2)
  $cryptopricedata[11] = "#{$priceskl_f}"
end
def grtmath
  $pricegrt_f = $pricegrt.to_f
  $pricegrt_r = $pricegrt_f.round(3)
  amountgrt = $owngrt * $pricegrt_f
  $amountgrt_r = amountgrt.round(2)
  breakevengrt = ($spentgrt / $owngrt)
  $breakevengrt_r = breakevengrt.round(3)
  earninsgrt = (($spentgrt - amountgrt) * -1)
  changegrt = ($oldmoneygrt - earninsgrt)
  $earninsgrt_r = earninsgrt.round(2)
  $oldmoneygrt = earninsgrt
  $oldpricegrt = $cryptopricedata[12]
  $oldpricegrt = $oldpricegrt.to_f
  grtpchange = ((($pricegrt_f - $oldpricegrt.to_f) / $oldpricegrt.to_f) * 100.0)
  $grtpchange_r = grtpchange.round(2)
  $cryptopricedata[12] = "#{$pricegrt_f}"
end
def mlnmath
  $pricemln_f = $pricemln.to_f
  $pricemln_r = $pricemln_f.round(3)
  amountmln = $ownmln * $pricemln_f
  $amountmln_r = amountmln.round(2)
  breakevenmln = ($spentmln / $ownmln)
  $breakevenmln_r = breakevenmln.round(3)
  earninsmln = (($spentmln - amountmln) * -1)
  changemln = ($oldmoneymln - earninsmln)
  $earninsmln_r = earninsmln.round(2)
  $oldmoneymln = earninsmln
  $oldpricemln = $cryptopricedata[13]
  $oldpricemln = $oldpricemln.to_f
  mlnpchange = ((($pricemln_f - $oldpricemln.to_f) / $oldpricemln.to_f) * 100.0)
  $mlnpchange_r = mlnpchange.round(2)
  $cryptopricedata[13] = "#{$pricemln_f}"
end
def eth2math
  $priceeth2_f = $priceeth2.to_f
  $priceeth2_r = $priceeth2_f.round(3)
  amounteth2 = $owneth2 * $priceeth2_f
  $amounteth2_r = amounteth2.round(2)
  breakeveneth2 = ($spenteth2 / $owneth2)
  $breakeveneth2_r = breakeveneth2.round(2)
  earninseth2 = (($spenteth2 - amounteth2) * -1)
  changeeth2 = ($oldmoneyeth2 - earninseth2)
  $earninseth2_r = earninseth2.round(2)
  $oldmoneyeth2 = earninseth2
  $oldpriceeth2 = $cryptopricedata[14]
  $oldpriceeth2 = $oldpriceeth2.to_f
  eth2pchange = ((($priceeth2_f - $oldpriceeth2.to_f) / $oldpriceeth2.to_f) * 100.0)
  $eth2pchange_r = eth2pchange.round(2)
  $cryptopricedata[14] = "#{$priceeth2_f}"
end
def shibmath
  $priceshib_f = $priceshib.to_f
  $priceshib_r = $priceshib_f.round(8)
  amountshib = $ownshib * $priceshib_f
  $amountshib_r = amountshib.round(8)
  breakevenshib = ($spentshib / $ownshib)
  $breakevenshib_r = breakevenshib.round(8)
  earninsshib = (($spentshib - amountshib) * -1)
  changeshib = ($oldmoneyshib - earninsshib)
  $earninsshib_r = earninsshib.round(2)
  $oldmoneyshib = earninsshib
  $oldpriceshib = $cryptopricedata[15]
  $oldpriceshib = $oldpriceshib.to_f
  shibpchange = ((($priceshib_f - $oldpriceshib.to_f) / $oldpriceshib.to_f) * 100.0)
  $shibpchange_r = shibpchange.round(2)
  $cryptopricedata[15] = "#{$priceshib_f}"
end
def closemath
  $serialized_array = Marshal.dump($cryptopricedata)
end
##Stat
def btcstat
  print "spent "
  print "#{$moneysymbol}#{$spentbtc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbtc.to_s}".colorize(:black).on_yellow
  puts " BTC"
end
def bchstat
  print "spent "
  print "#{$moneysymbol}#{$spentbch.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbch.to_s}".colorize(:black).on_yellow
  puts " BCH"
end
def ltcstat
  print "spent "
  print "#{$moneysymbol}#{$spentltc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownltc.to_s}".colorize(:black).on_yellow
  puts " LTC"
end
def dogestat
  print "spent "
  print "#{$moneysymbol}#{$spentdoge.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owndoge.to_s}".colorize(:black).on_yellow
  puts " DOGE"
end
def xlmstat
  print "spent "
  print "#{$moneysymbol}#{$spentxlm.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownxlm.to_s}".colorize(:black).on_yellow
  puts " XLM"
end
def batstat
  print "spent "
  print "#{$moneysymbol}#{$spentbat.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbat.to_s}".colorize(:black).on_yellow
  puts " BAT"
end
def ethstat
  print "spent "
  print "#{$moneysymbol}#{$spenteth.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owneth.to_s}".colorize(:black).on_yellow
  puts " ETH"
end
def solstat
  print "spent "
  print "#{$moneysymbol}#{$spentsol.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownsol.to_s}".colorize(:black).on_yellow
  puts " SOL"
end
def adastat
  print "spent "
  print "#{$moneysymbol}#{$spentada.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownada.to_s}".colorize(:black).on_yellow
  puts " ADA"
end
def lrcstat
  print "spent "
  print "#{$moneysymbol}#{$spentlrc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownlrc.to_s}".colorize(:black).on_yellow
  puts " LRC"
end
def ampstat
  print "spent "
  print "#{$moneysymbol}#{$spentamp.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownamp.to_s}".colorize(:black).on_yellow
  puts " AMP"
end
def sklstat
  print "spent "
  print "#{$moneysymbol}#{$spentskl.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownskl.to_s}".colorize(:black).on_yellow
  puts " SKL"
end
def grtstat
  print "spent "
  print "#{$moneysymbol}#{$spentgrt.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owngrt.to_s}".colorize(:black).on_yellow
  puts " GRT"
end
def mlnstat
  print "spent "
  print "#{$moneysymbol}#{$spentmln.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownmln.to_s}".colorize(:black).on_yellow
  puts " MLN"
end
def eth2stat
  print "spent "
  print "#{$moneysymbol}#{$spenteth2.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owneth2.to_s}".colorize(:black).on_yellow
  puts " ETH2"
end
def shibstat
  print "spent "
  print "#{$moneysymbol}#{$spentshib.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownshib.to_s}".colorize(:black).on_yellow
  puts " SHIB"
end
##HOLDS
def btchold
  print "Current BTC holdings Value: $#{$amountbtc_r} "
  if $pricebtc_r > $breakevenbtc_r
    puts "(#{$moneysymbol}#{$earninsbtc_r.to_s})".colorize(:black).on_green.underline
  elsif $pricebtc_r == $breakevenbtc_r
    puts "(#{$moneysymbol}#{$earninsbtc_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsbtc_r.to_s})".colorize(:black).on_red.underline
  end
end
def bchhold
  print "Current BCH holdings Value: $#{$amountbch_r} "
  if $pricebch_r > $breakevenbch_r
    puts "(#{$moneysymbol}#{$earninsbhc_r.to_s})".colorize(:black).on_green.underline
  elsif $pricebch_r == $breakevenbch_r
    puts "(#{$moneysymbol}#{$earninsbch_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsbch_r.to_s})".colorize(:black).on_red.underline
  end
end
def ltchold
  print "Current LTC holdings Value: $#{$amountltc_r} "
  if $priceltc_r > $breakevenltc_r
    puts "(#{$moneysymbol}#{$earninsltc_r.to_s})".colorize(:black).on_green.underline
  elsif $priceltc_r == $breakevenltc_r
    puts "(#{$moneysymbol}#{$earninsltc_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsltc_r.to_s})".colorize(:black).on_red.underline
  end
end
def dogehold
  print "Current DOGE holdings Value: $#{$amountdoge_r} "
  if $pricedoge_r > $breakevendoge_r
    puts "(#{$moneysymbol}#{$earninsdoge_r.to_s})".colorize(:black).on_green.underline
  elsif $pricedoge_r == $breakevendoge_r
    puts "(#{$moneysymbol}#{$earninsdoge_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsdoge_r.to_s})".colorize(:black).on_red.underline
  end
end
def xlmhold
  print "Current XLM holdings Value: $#{$amountxlm_r} "
  if $pricexlm_r > $breakevenxlm_r
    puts "(#{$moneysymbol}#{$earninsxlm_r.to_s})".colorize(:black).on_green.underline
  elsif $pricexlm_r == $breakevenxlm_r
    puts "(#{$moneysymbol}#{$earninsxlm_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsxlm_r.to_s})".colorize(:black).on_red.underline
  end
end
def bathold
  print "current BAT holdings Value: $#{$amountbat_r} "
  if $pricebat_r > $breakevenbat_r
    puts "(#{$moneysymbol}#{$earninsbat_r.to_s})".colorize(:black).on_green.underline
  elsif $pricebat_r == $breakevenbat_r
    puts "(#{$moneysymbol}#{$earninsbat_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsbat_r.to_s})".colorize(:black).on_red.underline
  end
end
def ethhold
  print "Current ETH holdings Value: $#{$amounteth_r} "
  if $priceeth_r > $breakeveneth_r
    puts "(#{$moneysymbol}#{$earninseth_r.to_s})".colorize(:black).on_green.underline
  elsif $priceeth_r == $breakeveneth_r
    puts "(#{$moneysymbol}#{$earninseth_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninseth_r.to_s})".colorize(:black).on_red.underline
  end
end
def solhold
  print "Current SOL holdings Value: $#{$amountsol_r} "
  if $pricesol_r > $breakevensol_r
    puts "(#{$moneysymbol}#{$earninssol_r.to_s})".colorize(:black).on_green.underline
  elsif $pricesol_r == $breakevensol_r
    puts "(#{$moneysymbol}#{$earninssol_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninssol_r.to_s})".colorize(:black).on_red.underline
  end
end
def adahold
  print "current ADA holdings Value: $#{$amountada_r} "
  if $priceada_r > $breakevenada_r
    puts "(#{$moneysymbol}#{$earninsada_r.to_s})".colorize(:black).on_green.underline
  elsif $priceada_r == $breakevenada_r
    puts "(#{$moneysymbol}#{$earninsada_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsada_r.to_s})".colorize(:black).on_red.underline
  end
end
def lrchold
  print "current LRC holdings Value: $#{$amountlrc_r} "
  if $pricelrc_r > $breakevenlrc_r
    puts "(#{$moneysymbol}#{$earninslrc_r.to_s})".colorize(:black).on_green.underline
  elsif $pricelrc_r == $breakevenlrc_r
    puts "(#{$moneysymbol}#{$earninslrc_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninslrc_r.to_s})".colorize(:black).on_red.underline
  end
end
def amphold
  print "current AMP holdings Value: $#{$amountamp_r} "
  if $priceamp_r > $breakevenamp_r
    puts "(#{$moneysymbol}#{$earninsamp_r.to_s})".colorize(:black).on_green.underline
  elsif $priceamp_r == $breakevenamp_r
    puts "(#{$moneysymbol}#{$earninsamp_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsamp_r.to_s})".colorize(:black).on_red.underline
  end
end
def sklhold
  print "current SKL holdings Value: $#{$amountskl_r} "
  if $priceskl_r > $breakevenskl_r
    puts "(#{$moneysymbol}#{$earninsskl_r.to_s})".colorize(:black).on_green.underline
  elsif $priceskl_r == $breakevenskl_r
    puts "(#{$moneysymbol}#{$earninsskl_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsskl_r.to_s})".colorize(:black).on_red.underline
  end
end
def grthold
  print "current GRT holdings Value: $#{$amountgrt_r} "
  if $pricegrt_r > $breakevengrt_r
    puts "(#{$moneysymbol}#{$earninsgrt_r.to_s})".colorize(:black).on_green.underline
  elsif $pricegrt_r == $breakevengrt_r
    puts "(#{$moneysymbol}#{$earninsgrt_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsgrt_r.to_s})".colorize(:black).on_red.underline
  end
end
def mlnhold
  print "current MLN holdings Value: $#{$amountmln_r} "
  if $pricemln_r > $breakevenmln_r
    puts "(#{$moneysymbol}#{$earninsmln_r.to_s})".colorize(:black).on_green.underline
  elsif $pricemln_r == $breakevenmln_r
    puts "(#{$moneysymbol}#{$earninsmln_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsmln_r.to_s})".colorize(:black).on_red.underline
  end
end
def eth2hold
  print "Current ETH2 holdings Value: $#{$amounteth2_r} "
  if $priceeth2_r > $breakeveneth2_r
    puts "(#{$moneysymbol}#{$earninseth2_r.to_s})".colorize(:black).on_green.underline
  elsif $priceeth2_r == $breakeveneth2_r
    puts "(#{$moneysymbol}#{$earninseth2_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninseth2_r.to_s})".colorize(:black).on_red.underline
  end
end
def shibhold
  print "Current SHIB holdings Value: $#{$amountshib_r} "
  if $priceshib_r > $breakevenshib_r
    puts "(#{$moneysymbol}#{$earninsshib_r.to_s})".colorize(:black).on_green.underline
  elsif $priceshib_r == $breakevenshib_r
    puts "(#{$moneysymbol}#{$earninsshib_r.to_s})".colorize(:black).on_yellow.underline
  else
    puts "(#{$moneysymbol}#{$earninsshib_r.to_s})".colorize(:black).on_red.underline
  end
end
##BREAKS
def btcbreak
  print "Current #{$moneysymbol}BTC: #{$moneysymbol}#{$pricebtc_r} ".colorize(:black).on_white
  if $pricebtc_r >= $breakevenbtc_r
    puts "Break-Even: #{$moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_green.underline
  elsif $pricebtc_r == $breakevenbtc_r
    puts "Break-Even: #{$moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even: #{$moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_red.underline
  end
end
def bchbreak
  print "Current #{$moneysymbol}BCH: #{$moneysymbol}#{$pricebch_r} ".colorize(:black).on_white
  if $pricebch_r >= $breakevenbch_r
    puts "Break-Even BCH: #{$moneysymbol}#{$breakevenbch_r}".colorize(:black).on_green.underline
  elsif $pricebch_r == $breakevenbch_r
    puts "Break-Even BCH: #{$moneysymbol}#{$breakevenbch_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even BCH: #{$moneysymbol}#{$breakevenbch_r}".colorize(:black).on_red.underline
  end
end
def ltcbreak
  print "Current #{$moneysymbol}LTC: #{$moneysymbol}#{$priceltc_r} ".colorize(:black).on_white
  if $priceltc_r >= $breakevenltc_r
    puts "Break-Even LTC: #{$moneysymbol}#{$breakevenltc_r}".colorize(:black).on_green.underline
  elsif $priceltc_r == $breakevenltc_r
    puts "Break-Even LTC: #{$moneysymbol}#{$breakevenltc_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even LTC: #{$moneysymbol}#{$breakevenltc_r}".colorize(:black).on_red.underline
  end
end
def dogebreak
  print "Current #{$moneysymbol}DOGE: #{$moneysymbol}#{$pricedoge_r} ".colorize(:black).on_white
  if $pricedoge_r >= $breakevendoge_r
    puts "Break-Even DOGE: #{$moneysymbol}#{$breakevendoge_r}".colorize(:black).on_green.underline
  elsif $pricedoge_r == $breakevendoge_r
    puts "Break-Even DOGE: #{$moneysymbol}#{$breakevendoge_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even DOGE: #{$moneysymbol}#{$breakevendoge_r}".colorize(:black).on_red.underline
  end
end
def xlmbreak
  print "Current #{$moneysymbol}XLM: #{$moneysymbol}#{$pricexlm_r} ".colorize(:black).on_white
  if $pricexlm_r >= $breakevenxlm_r
    puts "Break-Even XLM: #{$moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_green.underline
  elsif $pricexlm_r == $breakevenxlm_r
    puts "Break-Even XLM: #{$moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even XLM: #{$moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_red.underline
  end
end
def batbreak
  print "Current #{$moneysymbol}BAT: #{$moneysymbol}#{$pricebat_r} ".colorize(:black).on_white
  if $pricebat_r >= $breakevenbat_r
    puts "Break-Even BAT: #{$moneysymbol}#{$breakevenbat_r}".colorize(:black).on_green.underline
  elsif $pricebat_r == $breakevenbat_r
    puts "Break-Even BAT: #{$moneysymbol}#{$breakevenbat_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even BAT: #{$moneysymbol}#{$breakevenbat_r}".colorize(:black).on_red.underline
  end
end
def ethbreak
  print "Current #{$moneysymbol}ETH: #{$moneysymbol}#{$priceeth_r} ".colorize(:black).on_white
  if $priceeth_r >= $breakeveneth_r
    puts "Break-Even ETH: #{$moneysymbol}#{$breakeveneth_r}".colorize(:black).on_green.underline
  elsif $priceeth_r == $breakeveneth_r
    puts "Break-Even ETH: #{$moneysymbol}#{$breakeveneth_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even ETH: #{$moneysymbol}#{$breakeveneth_r}".colorize(:black).on_red.underline
  end
end
def solbreak
  print "Current #{$moneysymbol}SOL: #{$moneysymbol}#{$pricesol_r} ".colorize(:black).on_white
  if $pricesol_r >= $breakevensol_r
    puts "Break-Even SOL: #{$moneysymbol}#{$breakevensol_r}".colorize(:black).on_green.underline
  elsif $pricesol_r == $breakevensol_r
    puts "Break-Even SOL: #{$moneysymbol}#{$breakevensol_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even SOL: #{$moneysymbol}#{$breakevensol_r}".colorize(:black).on_red.underline
  end
end
def adabreak
  print "Current #{$moneysymbol}ADA: #{$moneysymbol}#{$priceada_r} ".colorize(:black).on_white
  if $priceada_r >= $breakevenada_r
    puts "Break-Even ADA: #{$moneysymbol}#{$breakevenada_r}".colorize(:black).on_green.underline
  elsif $priceada_r == $breakevenada_r
    puts "Break-Even ADA: #{$moneysymbol}#{$breakevenada_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even ADA: #{$moneysymbol}#{$breakevenada_r}".colorize(:black).on_red.underline
  end
end
def lrcbreak
  print "Current #{$moneysymbol}LRC: #{$moneysymbol}#{$pricelrc_r} ".colorize(:black).on_white
  if $pricelrc_r >= $breakevenlrc_r
    puts "Break-Even LRC: #{$moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_green.underline
  elsif $pricelrc_r == $breakevenlrc_r
    puts "Break-Even LRC: #{$moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even LRC: #{$moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_red.underline
  end
end
def ampbreak
  print "Current #{$moneysymbol}AMP: #{$moneysymbol}#{$priceamp_r} ".colorize(:black).on_white
  if $priceamp_r >= $breakevenamp_r
    puts "Break-Even AMP: #{$moneysymbol}#{$breakevenamp_r}".colorize(:black).on_green.underline
  elsif $priceamp_r == $breakevenamp_r
    puts "Break-Even AMP: #{$moneysymbol}#{$breakevenamp_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even AMP: #{$moneysymbol}#{$breakevenamp_r}".colorize(:black).on_red.underline
  end
end
def sklbreak
  print "Current #{$moneysymbol}SKL: #{$moneysymbol}#{$priceskl_r} ".colorize(:black).on_white
  if $priceskl_r >= $breakevenskl_r
    puts "Break-Even SKL: #{$moneysymbol}#{$breakevenskl_r}".colorize(:black).on_green.underline
  elsif $priceskl_r == $breakevenskl_r
    puts "Break-Even SKL: #{$moneysymbol}#{$breakevenskl_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even SKL: #{$moneysymbol}#{$breakevenskl_r}".colorize(:black).on_red.underline
  end
end
def grtbreak
  print "Current #{$moneysymbol}GRT: #{$moneysymbol}#{$pricegrt_r} ".colorize(:black).on_white
  if $pricegrt_r >= $breakevengrt_r
    puts "Break-Even GRT: #{$moneysymbol}#{$breakevengrt_r}".colorize(:black).on_green.underline
  elsif $pricegrt_r == $breakevengrt_r
    puts "Break-Even GRT: #{$moneysymbol}#{$breakevengrt_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even GRT: #{$moneysymbol}#{$breakevengrt_r}".colorize(:black).on_red.underline
  end
end
def mlnbreak
  print "Current #{$moneysymbol}MLN: #{$moneysymbol}#{$pricemln_r} ".colorize(:black).on_white
  if $pricemln_r >= $breakevenmln_r
    puts "Break-Even MLN: #{$moneysymbol}#{$breakevenmln_r}".colorize(:black).on_green.underline
  elsif $pricegrt_r == $breakevengrt_r
    puts "Break-Even MLN: #{$moneysymbol}#{$breakevenmln_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even MLN: #{$moneysymbol}#{$breakevenmln_r}".colorize(:black).on_red.underline
  end
end
def eth2break
  print "Current #{$moneysymbol}ETH2: #{$moneysymbol}#{$priceeth2_r} ".colorize(:black).on_white
  if $priceeth2_r >= $breakeveneth2_r
    puts "Break-Even ETH2: #{$moneysymbol}#{$breakeveneth2_r}".colorize(:black).on_green.underline
  elsif $priceeth2_r == $breakeveneth2_r
    puts "Break-Even ETH2: #{$moneysymbol}#{$breakeveneth2_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even ETH2: #{$moneysymbol}#{$breakeveneth2_r}".colorize(:black).on_red.underline
  end
end
def shibbreak
  print "Current #{$moneysymbol}SHIB: #{$moneysymbol}#{$priceshib_r} ".colorize(:black).on_white
  if $priceshib_r >= $breakevenshib_r
    puts "Break-Even SHIB: #{$moneysymbol}#{$breakevenshib_r}".colorize(:black).on_green.underline
  elsif $priceshib_r == $breakevenshib_r
    puts "Break-Even SHIB: #{$moneysymbol}#{$breakevenshib_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even SHIB: #{$moneysymbol}#{$breakevenshib_r}".colorize(:black).on_red.underline
  end
end
##TOTALS
def totals
  $totalearnins = ($earninsbtc_r + $earninsbch_r + $earninsltc_r + $earninsdoge_r + $earninsxlm_r + $earninsbat_r + $earninseth_r + $earninssol_r + $earninsada_r + $earninslrc_r + $earninsamp_r + $earninsskl_r + $earninsgrt_r + $earninsmln_r + $earninseth2_r + $earninsshib_r).round(2)
  $totalvalue  = ($amountbtc_r + $amountbch_r + $amountltc_r + $amountdoge_r + $amountxlm_r + $amountbat_r + $amounteth_r + $amountsol_r + $amountada_r + $amountlrc_r + $amountamp_r + $amountskl_r + $amountgrt_r + $amountmln_r + $amounteth2_r + $amountshib_r).round(2)
  $totalspent = ($spentbtc + $spentbch + $spentltc + $spentdoge + $spentxlm + $spentbat + $spenteth + $spentsol + $spentada + $spentlrc + $spentamp + $spentskl + $spentgrt + $spentmln + $spenteth2 + $spentshib)

  if $totalearnins >= 0
  print "Total Gains: "
  puts "#{$moneysymbol}#{$totalearnins.to_s}".colorize(:black).on_green.underline
  print "Total Spent: "
  puts "#{$moneysymbol}#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{$moneysymbol}#{$totalvalue.to_s}".colorize(:black).on_green.underline
  print "Precentage Gains: "
  puts "#{$precentage}%"
else
  print "Total losses: "
  puts "#{$moneysymbol}#{$totalearnins.to_s}".colorize(:white).on_red.underline
  print "Total Spent: "
  puts "#{$moneysymbol}#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{$moneysymbol}#{$totalvalue.to_s}".colorize(:white).on_red.underline
  print "Precentage loss: "
  puts "#{$precentage}%"
end
$precentage = ((($totalvalue - $totalspent) / $totalspent) * 100)
$precentage = $precentage.round(2)
end
##TRENDINGS
def btctrending
  if $pricebtc_f > $oldpricebtc
    puts "BTC trending up #{$btcpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebtc_f < $oldpricebtc
    puts "BTC trending down #{$btcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BTC price has not changed since last update"
  end
end
def bchtrending
  if $pricebch_f > $oldpricebch
    puts "BCH trending up #{$bchpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebch_f < $oldpricebch
    puts "BCH trending down #{$bchpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BCH price has not changed since last update"
  end
end
def ltctrending
  if $priceltc_f > $oldpriceltc
    puts "LTC trending up #{$ltcpchange_r}%".colorize(:green).on_black.blink
  elsif $priceltc_f < $oldpriceltc
    puts "LTC trending down #{$ltcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "LTC price has not changed since last update"
  end
end
def dogetrending
  if $pricedoge_f > $oldpricedoge
    puts "DOGE trending up #{$dogepchange_r}%".colorize(:green).on_black.blink
  elsif $pricedoge_f < $oldpricedoge
    puts "DOGE trending down #{$dogepchange_r}%".colorize(:red).on_black.blink
  else
    puts "DOGE price has not changed since last update"
  end
end
def ethtrending
  if $priceeth_f > $oldpriceeth
    puts "ETH trending up #{$ethpchange_r}%".colorize(:green).on_black.blink
  elsif $priceeth_f < $oldpriceeth
    puts "ETH trending down #{$ethpchange_r}%".colorize(:red).on_black.blink
  else
    puts "ETH price has not changed since last update"
  end
end
def battrending
  if $pricebat_f > $oldpricebat
    puts "BAT trending up #{$batpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebat_f < $oldpricebat
    puts "BAT trending down #{$batpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BAT price has not changed since last update"
  end
end
def soltrending
  if $pricesol_f > $oldpricesol
    puts "SOL trending up #{$solpchange_r}%".colorize(:green).on_black.blink
  elsif $pricesol_f < $oldpricesol
    puts "SOL trending down #{$solpchange_r}%".colorize(:red).on_black.blink
  else
    puts "SOL price has not changed since last update"
  end
end
def adatrending
  if $priceada_f > $oldpriceada
    puts "ADA trending up #{$adapchange_r}%".colorize(:green).on_black.blink
  elsif $priceada_f < $oldpriceada
    puts "ADA trending down #{$adapchange_r}%".colorize(:red).on_black.blink
  else
    puts "ADA price has not changed since last update"
  end
end
def lrctrending
  if $pricelrc_f > $oldpricelrc
    puts "LRC trending up #{$lrcpchange_r}%".colorize(:green).on_black.blink
  elsif $pricelrc_f < $oldpricelrc
    puts "LRC trending down #{$lrcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "LRC price has not changed since last update"
  end
end
def xlmtrending
  if $pricexlm_f > $oldpricexlm
    puts "XLM trending up #{$xlmpchange_r}%".colorize(:green).on_black.blink
  elsif $pricexlm_f < $oldpricexlm
    puts "XLM trending down #{$xlmpchange_r}%".colorize(:red).on_black.blink
  else
    puts "XLM price has not changed since last update"
  end
end
def amptrending
  if $priceamp_f > $oldpriceamp
    puts "AMP trending up #{$amppchange_r}%".colorize(:green).on_black.blink
  elsif $priceamp_f < $oldpriceamp
    puts "AMP trending down #{$amppchange_r}%".colorize(:red).on_black.blink
  else
    puts "AMP price has not changed since last update"
  end
end
def skltrending
  if $priceskl_f > $oldpriceskl
    puts "SKL trending up #{$sklpchange_r}%".colorize(:green).on_black.blink
  elsif $priceskl_f < $oldpriceskl
    puts "SKL trending down #{$sklpchange_r}%".colorize(:red).on_black.blink
  else
    puts "SKL price has not changed since last update"
  end
end
def grttrending
  if $pricegrt_f > $oldpricegrt
    puts "GRT trending up #{$grtpchange_r}%".colorize(:green).on_black.blink
  elsif $pricegrt_f < $oldpricegrt
    puts "GRT trending down #{$grtpchange_r}%".colorize(:red).on_black.blink
  else
    puts "GRT price has not changed since last update"
  end
end
def mlntrending
  if $pricemln_f > $oldpricemln
    puts "MLN trending up #{$mlnpchange_r}%".colorize(:green).on_black.blink
  elsif $pricemln_f < $oldpricemln
    puts "MLN trending down #{$mlnpchange_r}%".colorize(:red).on_black.blink
  else
    puts "MLN price has not changed since last update"
  end
end
def eth2trending
  if $priceeth2_f > $oldpriceeth2
    puts "ETH2 trending up #{$eth2pchange_r}%".colorize(:green).on_black.blink
  elsif $priceeth2_f < $oldpriceeth2
    puts "ETH2 trending down #{$eth2pchange_r}%".colorize(:red).on_black.blink
  else
    puts "ETH2 price has not changed since last update"
  end
end
def shibtrending
  if $priceshib_f > $oldpriceshib
    puts "SHIB trending up #{$shibpchange_r}%".colorize(:green).on_black.blink
  elsif $priceshib_f < $oldpriceshib
    puts "SHIB trending down #{$shibpchange_r}%".colorize(:red).on_black.blink
  else
    puts "SHIB price has not changed since last update"
  end
end
def trendingclose
    time = Time.new
    $ltc = time.strftime("%Y-%m-%d-%H:%M:%S")
    puts "Last update #{$ltc}"
    File.open('cryptopricedata.txt', 'w') {|f| f.write($serialized_array) }
end
def controlcenter
  puts "=========control-center========="
  if $noti == "y"
    print "notifications are currently "
    puts "on".colorize(:black).on_green
  else
    print "notifications are currently "
    puts "off".colorize(:black).on_red
  end
  if $currency == 3
    puts "Display currency is currently USD"
  elsif $currency == 2
    puts "Display currency is currently RUB"
  elsif $currency == 1
    puts "Display currency is currently EUR"
  else
    puts "ERROR! Incorect currency selection, Currency being set to USD".colorize(:black).on_red
    $currency == 3
  end
  if $logging == "y"
    print "Logging "
    puts "Enabled".colorize(:black).on_green
  else
    print "Logging "
    puts "Disabled".colorize(:black).on_red
  end
  puts "current time between updates is #{$time.to_s} seconds"
  puts "press 'q' + 'enter' to quit"
  puts "press 'n' + 'enter' to toggle notifications"
  puts "press 't' + 'enter' to change update time"
  puts "press 'm' + 'enter' to change currency"
  puts "press 'l' + 'enter' to toggle logging"
  sleep ($time)
end
def startup
  saved = File.exist?('prefs.txt')
  if saved.to_s == "true"
    $prefs_file = ("prefs.txt")
    prefs = File.open("#{$prefs_file}")
    prefs_data = prefs.readlines.map(&:chomp)
    $notiraw = prefs_data[1]
    $currencyraw = prefs_data[3]
    $loggingraw = prefs_data[5]
    $noti = $notiraw.to_s
    $currency = $currencyraw.to_i
    $sourcecur = $currencyraw.to_i
    $logging = $loggingraw.to_s
  else
    $noti = "z"
    until $noti == "y" || $noti == "n" do
  puts "enable notifications? (y/n)"
  $noti = gets.chomp
  $sourcecur = 0
  end
  until $sourcecur == 1 || $sourcecur == 2 || $sourcecur == 3 do
  puts "what is source Currency? (1 for EUR, 2 for RUB, 3 for USD)"
  $sourcecur = gets.to_i
  $currency = $sourcecur.to_i
  end
  $logging ="z"
  until $logging == "y" || $logging == "n" do
  puts "would you like to enable logging? (y/n)"
  $logging = gets.chomp
  end
  mkpref = "z"
  until mkpref == "y" || mkpref =="n" do
  puts "would you like to save your answers? (y/n)"
  mkpref = gets.chomp
  end
  end
  if mkpref.to_s == "y"
    File.open("prefs.txt", 'a+') {|f| f.write("Notifications? \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("#{$noti.to_s} \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("Currency? \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("#{$currency.to_i} \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("Logging? \n") }
    File.open("prefs.txt", 'a+') {|f| f.write("#{$logging.to_s} \n") }
  else
  end
end
def display
  if $ownbtc.to_f > 0
    puts "============BTC============".colorize(:black).on_light_cyan
    btcstat
    btchold
    btcbreak
    btctrending
    puts "==========================="
  else
  end
  if $ownbch.to_f > 0
    puts "============BCH============".colorize(:black).on_light_cyan
    bchstat
    bchhold
    bchbreak
    bchtrending
    puts "==========================="
  else
  end
  if $ownltc.to_f > 0
    puts "============LTC============".colorize(:black).on_light_cyan
    ltcstat
    ltchold
    ltcbreak
    ltctrending
    puts "==========================="
  else
  end
  if $owndoge.to_f > 0
    puts "============DOGE============".colorize(:black).on_light_cyan
    dogestat
    dogehold
    dogebreak
    dogetrending
    puts "============================"
  else
  end
  if $owneth.to_f > 0
    puts "============ETH============".colorize(:black).on_light_cyan
    ethstat
    ethhold
    ethbreak
    ethtrending
    puts "==========================="
  else
  end
  if $ownbat.to_f > 0
    puts "============BAT============".colorize(:black).on_light_cyan
    batstat
    bathold
    batbreak
    battrending
    puts "==========================="
  else
  end
  if $ownsol.to_f > 0
    puts "============SOL============".colorize(:black).on_light_cyan
    solstat
    solhold
    solbreak
    soltrending
    puts "==========================="
  else
  end
  if $ownada.to_f > 0
    puts "============ADA============".colorize(:black).on_light_cyan
    adastat
    adahold
    adabreak
    adatrending
    puts "==========================="
  else
  end
  if $ownlrc.to_f > 0
    puts "============LRC============".colorize(:black).on_light_cyan
    lrcstat
    lrchold
    lrcbreak
    lrctrending
    puts "==========================="
  else
  end
  if $ownxlm.to_f > 0
    puts "============XLM============".colorize(:black).on_light_cyan
    xlmstat
    xlmhold
    xlmbreak
    xlmtrending
    puts "==========================="
  else
  end
  if $ownamp.to_f > 0
    puts "============AMP============".colorize(:black).on_light_cyan
    ampstat
    amphold
    ampbreak
    amptrending
    puts "==========================="
  else
  end
  if $ownskl.to_f > 0
    puts "============SKL============".colorize(:black).on_light_cyan
    sklstat
    sklhold
    sklbreak
    skltrending
    puts "==========================="
  else
  end
  if $owngrt.to_f > 0
    puts "============GRT===========".colorize(:black).on_light_cyan
    grtstat
    grthold
    grtbreak
    grttrending
    puts "==========================="
  else
  end
  if $ownmln.to_f > 0
    puts "============MLN============".colorize(:black).on_light_cyan
    mlnstat
    mlnhold
    mlnbreak
    mlntrending
    puts "==========================="
  else
  end
  if $owneth2.to_f > 0
    puts "============ETH2============".colorize(:black).on_light_cyan
    eth2stat
    eth2hold
    eth2break
    eth2trending
    puts "============================"
  else
  end
  if $ownshib.to_f > 0
    puts "============SHIB============".colorize(:black).on_light_cyan
    shibstat
    shibhold
    shibbreak
    shibtrending
    puts "============================"
  else
  end
  totals
  trendingclose
  controlcenter
  if $logging == "y"
  logging
  else
  end
  if $noti == "y"
  notifications
  $n += 1
  else
  end
end
###BEGIN PROGRAM HERE###
startup
$k = 1
$n = 0
setup
system "clear"
$loading = 0
Thread.new {until $loading == 1 do
  print "Loading latest Crypto Prices"
  $run = 1
  until $run == 6 do
    print "."
    $run += 1
    sleep 0.3
  end
  print "\n"
  system "clear"
end}
Thread.new {control = gets.chomp
while $k == 1 do
  if control == "q"
  $k = 2
  puts "Exiting......"
elsif control == "n" && $noti == "y" || control == "n" && $noti == "y "
  $noti = "n"
  puts "notifications off"
  control = gets.chomp
elsif control == "n" && $noti == "n" || control == "n" && $noti == "n "
  $noti = "y"
  puts "notifications on"
  $n = 10
  control = gets.chomp
elsif control == "t"
  print "enter new time between updates in seconds: "
  $time = gets.to_i
  control = gets.chomp
elsif control == "m"
  puts "what currency would you like to display in? (1 for EUR, 2 for RUB, 3 for USD)"
  $currency = gets.to_i
  if $currency == 3
    puts "currency is now USD"
    setup
  elsif $currency == 2
    puts "currency is now RUB"
    setup
  elsif $currency == 1
    puts "currency is now EUR"
    setup
  else
    puts "incorrect key defaulting to USD"
    $currency = 3
    setup
  end
  control = gets.chomp
elsif control == "l" && $logging == "y" || control == "l" && $logging == "y "
  $logging = "n"
  puts "Logging Disabled"
  control = gets.chomp
elsif control == "l" && $logging == "n" || control == "l" && $logging == "n "
  $logging = "y"
  puts "Logging Enabled"
  control = gets.chomp
else
  puts "unknown key, please try again."
  control = gets.chomp
end
end}
currency
$loading = 1
sleep 2
while $k == 1 do
  puts "###### Crypto Watch Dashboard ######"
  puts "###### By Connor W. Needling ######"
  puts "###### Version #{$version.chomp} ######"
  convert
  btcmath
  bchmath
  ltcmath
  dogemath
  ethmath
  batmath
  solmath
  adamath
  lrcmath
  xlmmath
  ampmath
  sklmath
  grtmath
  mlnmath
  eth2math
  shibmath
  closemath
  display
  time = Time.new
  $nlct = time.strftime("%Y-%m-%d-%H:%M:%S")
  puts "Price Refresh started...#{$nlct}".colorize(:black).on_yellow
  currency
  system "clear"
end
