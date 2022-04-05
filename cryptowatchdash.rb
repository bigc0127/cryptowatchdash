#!/usr/bin/env ruby
require 'colorize'
require 'csv'
require 'notify-send'
def setup
  $time = 10
  $dataset = "cryptodata.txt"
  file = File.open("#{$dataset}")
  file_data = file.readlines.map(&:chomp)
  ownbtcraw = file_data[1]
  $ownbtc = ownbtcraw.to_f
  $oldpricebtc = 1
  $oldmoneybtc = 0
  $spentbtcraw = file_data[3]
  $spentbtc = $spentbtcraw.to_f

  ownbchraw = file_data[5]
  $ownbch = ownbchraw.to_f
  $oldpricebch = 1
  $oldmoneybch = 0
  $spentbchraw = file_data[7]
  $spentbch = $spentbchraw.to_f

  ownltcraw = file_data[9]
  $ownltc = ownltcraw.to_f
  $oldpriceltc = 1
  $oldmoneyltc = 0
  $spentltcraw = file_data[11]
  $spentltc = $spentltcraw.to_f

  owndogeraw = file_data[13]
  $owndoge = owndogeraw.to_f
  $oldpricedoge = 1
  $oldmoneydoge = 0
  $spentdogeraw = file_data[15]
  $spentdoge = $spentdogeraw.to_f

  ownxlmraw = file_data[17]
  $ownxlm = ownxlmraw.to_f
  $oldpricexlm = 1
  $oldmoneyxlm = 0
  $spentxlmraw = file_data[19]
  $spentxlm = $spentxlmraw.to_f

  ownbatraw = file_data[21]
  $ownbat = ownbatraw.to_f
  $oldpricebat = 1
  $oldmoneybat = 0
  $spentbatraw = file_data[23]
  $spentbat = $spentbatraw.to_f

  ownethraw = file_data[25]
  $owneth = ownethraw.to_f
  $oldpriceeth = 1
  $oldmoneyeth = 0
  $spentethraw = file_data[27]
  $spenteth = $spentethraw.to_f

  ownsolraw = file_data[29]
  $ownsol = ownsolraw.to_f
  $oldpricesol = 1
  $oldmoneysol = 0
  $spentsolraw = file_data[31]
  $spentsol = $spentsolraw.to_f

  ownadaraw = file_data[33]
  $ownada = ownadaraw.to_f
  $oldpriceada = 1
  $oldmoneyada = 0
  $spentadaraw = file_data[35]
  $spentada = $spentadaraw.to_f

  ownlrcraw = file_data[37]
  $ownlrc = ownlrcraw.to_f
  $oldpricelrc = 1
  $oldmoneylrc = 0
  $spentlrcraw = file_data[39]
  $spentlrc = $spentlrcraw.to_f

  ownampraw = file_data[41]
  $ownamp = ownampraw.to_f
  $oldpriceamp = 1
  $oldmoneyamp = 0
  $spentampraw = file_data[43]
  $spentamp = $spentampraw.to_f

  ownsklraw = file_data[45]
  $ownskl = ownsklraw.to_f
  $oldpriceskl = 1
  $oldmoneyskl = 0
  $spentsklraw = file_data[47]
  $spentskl = $spentsklraw.to_f

  owngrtraw = file_data[49]
  $owngrt = owngrtraw.to_f
  $oldpricegrt = 1
  $oldmoneygrt = 0
  $spentgrtraw = file_data[51]
  $spentgrt = $spentgrtraw.to_f

  $cryptopricedata = Array.new(12)

end
def prices
  if $currency == 3
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
    elsif $currency == 2
      pricebtc = %x[curl -s https://api.coinbase.com/v2/prices/btc-rub/spot | awk -F '"' '{print $14}']
      pricebch = %x[curl -s https://api.coinbase.com/v2/prices/bch-rub/spot | awk -F '"' '{print $14}']
      priceltc = %x[curl -s https://api.coinbase.com/v2/prices/ltc-rub/spot | awk -F '"' '{print $14}']
      pricedoge = %x[curl -s https://api.coinbase.com/v2/prices/doge-rub/spot | awk -F '"' '{print $14}']
      pricexlm = %x[curl -s https://api.coinbase.com/v2/prices/xlm-rub/spot | awk -F '"' '{print $14}']
      pricebat = %x[curl -s https://api.coinbase.com/v2/prices/bat-rub/spot | awk -F '"' '{print $14}']
      priceeth = %x[curl -s https://api.coinbase.com/v2/prices/eth-rub/spot | awk -F '"' '{print $14}']
      pricesol = %x[curl -s https://api.coinbase.com/v2/prices/sol-rub/spot | awk -F '"' '{print $14}']
      priceada = %x[curl -s https://api.coinbase.com/v2/prices/ada-rub/spot | awk -F '"' '{print $14}']
      pricelrc = %x[curl -s https://api.coinbase.com/v2/prices/lrc-rub/spot | awk -F '"' '{print $14}']
      priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-rub/spot | awk -F '"' '{print $14}']
      priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-rub/spot | awk -F '"' '{print $14}']
      pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-rub/spot | awk -F '"' '{print $14}']
    elsif $currency == 1
      pricebtc = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tBTCEUR | awk -F "," '{print $7}']
      pricebch = %x[curl -s https://api.coinbase.com/v2/prices/bch-eur/spot | awk -F '"' '{print $14}']
      priceltc = %x[curl -s https://api.coinbase.com/v2/prices/ltc-eur/spot | awk -F '"' '{print $14}']
      pricedoge = %x[curl -s https://api.coinbase.com/v2/prices/doge-eur/spot | awk -F '"' '{print $14}']
      pricexlm = %x[curl -s https://api.coinbase.com/v2/prices/xlm-eur/spot | awk -F '"' '{print $14}']
      pricebat = %x[curl -s https://api.coinbase.com/v2/prices/bat-eur/spot | awk -F '"' '{print $14}']
      priceeth = %x[curl -s https://api-pub.bitfinex.com/v2/ticker/tETHEUR | awk -F "," '{print $7}']
      pricesol = %x[curl -s https://api.coinbase.com/v2/prices/sol-eur/spot | awk -F '"' '{print $14}']
      priceada = %x[curl -s https://api.coinbase.com/v2/prices/ada-eur/spot | awk -F '"' '{print $14}']
      pricelrc = %x[curl -s https://api.coinbase.com/v2/prices/lrc-eur/spot | awk -F '"' '{print $14}']
      priceamp = %x[curl -s https://api.coinbase.com/v2/prices/amp-eur/spot | awk -F '"' '{print $14}']
      priceskl = %x[curl -s https://api.coinbase.com/v2/prices/skl-eur/spot | awk -F '"' '{print $14}']
      pricegrt = %x[curl -s https://api.coinbase.com/v2/prices/grt-eur/spot | awk -F '"' '{print $14}']
    else
      puts "incorrect currency selection useing last saved prices and changing to USD"
      $currency == 3
    end

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

      $pricebtc_r = $pricebtc_f.round(3)
      $pricebch_r = $pricebch_f.round(3)
      $priceltc_r = $priceltc_f.round(3)
      $pricedoge_r = $pricedoge_f.round(4)
      $pricexlm_r = $pricexlm_f.round(3)
      $pricebat_r = $pricebat_f.round(3)
      $priceeth_r = $priceeth_f.round(3)
      $pricesol_r = $pricesol_f.round(3)
      $priceada_r = $priceada_f.round(3)
      $pricelrc_r = $pricelrc_f.round(3)
      $priceamp_r = $priceamp_f.round(4)
      $priceskl_r = $priceskl_f.round(4)
      $pricegrt_r = $pricegrt_f.round(3)

      amountbtc = $ownbtc * $pricebtc_f
      amountbch = $ownbch * $pricebch_f
      amountltc = $ownltc * $priceltc_f
      amountdoge = $owndoge * $pricedoge_f
      amountxlm = $ownxlm * $pricexlm_f
      amountbat = $ownbat * $pricebat_f
      amounteth = $owneth * $priceeth_f
      amountsol = $ownsol * $pricesol_f
      amountada = $ownada * $priceada_f
      amountlrc = $ownlrc * $pricelrc_f
      amountamp = $ownamp * $priceamp_f
      amountskl = $ownskl * $priceskl_f
      amountgrt = $owngrt * $pricegrt_f

      $amountbtc_r = amountbtc.round(2)
      $amountbch_r = amountbch.round(2)
      $amountltc_r = amountltc.round(2)
      $amountdoge_r = amountdoge.round(2)
      $amountxlm_r = amountxlm.round(2)
      $amountbat_r = amountbat.round(2)
      $amounteth_r = amounteth.round(2)
      $amountsol_r = amountsol.round(2)
      $amountada_r = amountada.round(2)
      $amountlrc_r = amountlrc.round(2)
      $amountamp_r = amountamp.round(2)
      $amountskl_r = amountskl.round(2)
      $amountgrt_r = amountgrt.round(2)

      breakevenbtc = ($spentbtc / $ownbtc)
      breakevenbch = ($spentbch / $ownbch)
      breakevenltc = ($spentltc / $ownltc)
      breakevendoge = ($spentdoge / $owndoge)
      breakevenxlm = ($spentxlm / $ownxlm)
      breakevenbat = ($spentbat / $ownbat)
      breakeveneth = ($spenteth / $owneth)
      breakevensol = ($spentsol / $ownsol)
      breakevenada = ($spentada / $ownada)
      breakevenlrc = ($spentlrc / $ownlrc)
      breakevenamp = ($spentamp / $ownamp)
      breakevenskl = ($spentskl / $ownskl)
      breakevengrt = ($spentgrt / $owngrt)

      $breakevenbtc_r = breakevenbtc.round(2)
      $breakevenbch_r = breakevenbch.round(2)
      $breakevenltc_r = breakevenltc.round(2)
      $breakevendoge_r = breakevendoge.round(3)
      $breakevenxlm_r = breakevenxlm.round(2)
      $breakevenbat_r = breakevenbat.round(2)
      $breakeveneth_r = breakeveneth.round(2)
      $breakevensol_r = breakevensol.round(2)
      $breakevenada_r = breakevenada.round(2)
      $breakevenlrc_r = breakevenlrc.round(2)
      $breakevenamp_r = breakevenamp.round(3)
      $breakevenskl_r = breakevenskl.round(3)
      $breakevengrt_r = breakevengrt.round(3)

      earninsbtc = (($spentbtc - amountbtc) * -1)
      changebtc = ($oldmoneybtc - earninsbtc)
      $earninsbtc_r = earninsbtc.round(2)
      $oldmoneybtc = earninsbtc

      earninsbch = (($spentbch - amountbch) * -1)
      changebch = ($oldmoneybch - earninsbch)
      $earninsbch_r = earninsbch.round(2)
      $oldmoneybch = earninsbch

      earninsltc = (($spentltc - amountltc) * -1)
      changeltc = ($oldmoneyltc - earninsltc)
      $earninsltc_r = earninsltc.round(2)
      $oldmoneyltc = earninsltc

      earninsdoge = (($spentdoge - amountdoge) * -1)
      changedoge = ($oldmoneydoge - earninsdoge)
      $earninsdoge_r = earninsdoge.round(2)
      $oldmoneydoge = earninsdoge

      earninsxlm = (($spentxlm - amountxlm) * -1)
      changexlm = ($oldmoneyxlm - earninsxlm)
      $earninsxlm_r = earninsxlm.round(2)
      $oldmoneyxlm = earninsxlm

      earninsbat = (($spentbat - amountbat) * -1)
      changebat = ($oldmoneybat - earninsbat)
      $earninsbat_r = earninsbat.round(2)
      $oldmoneybat = earninsbat

      earninseth = (($spenteth - amounteth) * -1)
      changeeth = ($oldmoneyeth - earninseth)
      $earninseth_r = earninseth.round(2)
      $oldmoneyeth = earninseth

      earninssol = (($spentsol - amountsol) * -1)
      changesol = ($oldmoneysol - earninssol)
      $earninssol_r = earninssol.round(2)
      $oldmoneysol = earninssol

      earninsada = (($spentada - amountada) * -1)
      changeada = ($oldmoneyada - earninsada)
      $earninsada_r = earninsada.round(2)
      $oldmoneyada = earninsada

      earninslrc = (($spentlrc - amountlrc) * -1)
      changelrc = ($oldmoneylrc - earninslrc)
      $earninslrc_r = earninslrc.round(2)
      $oldmoneylrc = earninslrc

      earninsamp = (($spentamp - amountamp) * -1)
      changeamp = ($oldmoneyamp - earninsamp)
      $earninsamp_r = earninsamp.round(2)
      $oldmoneyamp = earninsamp

      earninsskl = (($spentskl - amountskl) * -1)
      changeskl = ($oldmoneyskl - earninsskl)
      $earninsskl_r = earninsskl.round(2)
      $oldmoneyskl = earninsskl

      earninsgrt = (($spentgrt - amountgrt) * -1)
      changegrt = ($oldmoneygrt - earninsgrt)
      $earninsgrt_r = earninsgrt.round(2)
      $oldmoneygrt = earninsgrt

      $totalearnins = ($earninsbtc_r + $earninsbch_r + $earninsltc_r + $earninsdoge_r + $earninsxlm_r + $earninsbat_r + $earninseth_r + $earninssol_r + $earninsada_r + $earninslrc_r + $earninsamp_r + $earninsskl_r + $earninsgrt_r).round(2)
      $totalvalue  = ($amountbtc_r + $amountbch_r + $amountltc_r + $amountdoge_r + $amountxlm_r + $amountbat_r + $amounteth_r + $amountsol_r + $amountada_r + $amountlrc_r + $amountamp_r + $amountskl_r + $earninsgrt_r).round(2)
      $totalspent = ($spentbtc + $spentbch + $spentltc + $spentdoge + $spentxlm + $spentbat + $spenteth + $spentsol + $spentada + $spentlrc + $spentamp + $spentskl + $spentgrt)

      $precentage = ((($totalvalue - $totalspent) / $totalspent) * 100)
      $cryptopricedata = Marshal.load File.read('cryptopricedata.txt')

      $oldpricebtc = $cryptopricedata[0]
      $oldpricebtc = $oldpricebtc.to_f

      $oldpricebch = $cryptopricedata[1]
      $oldpricebch = $oldpricebch.to_f

      $oldpriceltc = $cryptopricedata[2]
      $oldpriceltc = $oldpriceltc.to_f

      $oldpricedoge = $cryptopricedata[3]
      $oldpricedoge = $oldpricedoge.to_f

      $oldpricexlm = $cryptopricedata[4]
      $oldpricexlm = $oldpricexlm.to_f

      $oldpricebat = $cryptopricedata[5]
      $oldpricebat = $oldpricebat.to_f

      $oldpriceeth = $cryptopricedata[6]
      $oldpriceeth = $oldpriceeth.to_f

      $oldpricesol = $cryptopricedata[7]
      $oldpricesol = $oldpricesol.to_f

      $oldpriceada = $cryptopricedata[8]
      $oldpriceada = $oldpriceada.to_f

      $oldpricelrc = $cryptopricedata[9]
      $oldpricelrc = $oldpricelrc.to_f

      $oldpriceamp = $cryptopricedata[10]
      $oldpriceamp = $oldpriceamp.to_f

      $oldpriceskl = $cryptopricedata[11]
      $oldpriceskl = $oldpriceskl.to_f

      $oldpricegrt = $cryptopricedata[12]
      $oldpricegrt = $oldpricegrt.to_f

      btcpchange = ((($pricebtc_f - $oldpricebtc.to_f) / $oldpricebtc.to_f) * 100.0)
      $btcpchange_r = btcpchange.round(2)

      bchpchange = ((($pricebch_f - $oldpricebch.to_f) / $oldpricebch.to_f) * 100.0)
      $bchpchange_r = bchpchange.round(2)

      ltcpchange = ((($priceltc_f - $oldpriceltc.to_f) / $oldpriceltc.to_f) * 100.0)
      $ltcpchange_r = ltcpchange.round(2)

      dogepchange = ((($pricedoge_f - $oldpricedoge.to_f) / $oldpricedoge.to_f) * 100.0)
      $dogepchange_r = dogepchange.round(2)

      xlmchange = ((($pricexlm_f - $oldpricexlm.to_f) / $oldpricexlm.to_f) * 100.0)
      $xlmpchange_r = xlmchange.round(2)

      batpchnage = ((($pricebat_f - $oldpricebat.to_f) / $oldpricebat.to_f) * 100.0)
      $batpchange_r = batpchnage.round(2)

      ethpchange = ((($priceeth_f - $oldpriceeth.to_f) / $oldpriceeth.to_f) * 100.0)
      $ethpchange_r = ethpchange.round(2)

      solpchange = ((($pricesol_f - $oldpricesol.to_f) / $oldpricesol.to_f) * 100.0)
      $solpchange_r = solpchange.round(2)

      adapchange = ((($priceada_f - $oldpriceada.to_f) / $oldpriceada.to_f) * 100.0)
      $adapchange_r = adapchange.round(2)

      lrcpchange = ((($pricelrc_f - $oldpricelrc.to_f) / $oldpricelrc.to_f) * 100.0)
      $lrcpchange_r = lrcpchange.round(2)

      amppchange = ((($priceamp_f - $oldpriceamp.to_f) / $oldpriceamp.to_f) * 100.0)
      $amppchange_r = amppchange.round(2)

      sklpchange = ((($priceskl_f - $oldpriceskl.to_f) / $oldpriceskl.to_f) * 100.0)
      $sklpchange_r = sklpchange.round(2)

      grtpchange = ((($pricegrt_f - $oldpricegrt.to_f) / $oldpricegrt.to_f) * 100.0)
      $grtpchange_r = grtpchange.round(2)

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

      $precentage = $precentage.round(2)
      $serialized_array = Marshal.dump($cryptopricedata)
end
$version = %x[cat ./installed-version]
def basicoutput
  system "clear"
  puts "###### Crypto Watch Dashboard ######"
  puts "###### By Connor W. Needling ######"
  puts "###### Version #{$version.chomp} ######"
if $currency == 3
  moneysymbol = "$"
elsif $currency == 2
  moneysymbol = "₽"
else
  moneysymbol = "€"
end
  if $ownbtc.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentbtc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbtc.to_s}".colorize(:black).on_yellow
  puts " BTC"
else
end
if $ownbch.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentbch.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbch.to_s}".colorize(:black).on_yellow
  puts " BCH"
else
end
if $ownltc.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentltc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownltc.to_s}".colorize(:black).on_yellow
  puts " LTC"
else
end
if $owndoge.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentdoge.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owndoge.to_s}".colorize(:black).on_yellow
  puts " DOGE"
else
end
if $ownxlm.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentxlm.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownxlm.to_s}".colorize(:black).on_yellow
  puts " XLM"
else
end
if $ownbat.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentbat.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbat.to_s}".colorize(:black).on_yellow
  puts " BAT"
else
end
if $owneth.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spenteth.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owneth.to_s}".colorize(:black).on_yellow
  puts " ETH"
else
end
if $ownsol.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentsol.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownsol.to_s}".colorize(:black).on_yellow
  puts " SOL"
else
end
if $ownada.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentada.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownada.to_s}".colorize(:black).on_yellow
  puts " ADA"
else
end
if $ownlrc.to_f > 0
  print "spent "
  print "#{moneysymbol}#{$spentlrc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownlrc.to_s}".colorize(:black).on_yellow
  puts " LRC"
else
end
  if $ownamp.to_f > 0
    print "spent "
    print "#{moneysymbol}#{$spentamp.to_s}".colorize(:black).on_green
    print " on "
    print "#{$ownamp.to_s}".colorize(:black).on_yellow
    puts " AMP"
  else
end
  if $ownskl.to_f > 0
    print "spent "
    print "#{moneysymbol}#{$spentskl.to_s}".colorize(:black).on_green
    print " on "
    print "#{$ownskl.to_s}".colorize(:black).on_yellow
    puts " SKL"
  else
end
  if $owngrt.to_f > 0
    print "spent "
    print "#{moneysymbol}#{$spentgrt.to_s}".colorize(:black).on_green
    print " on "
    print "#{$owngrt.to_s}".colorize(:black).on_yellow
    puts " GRT"
  else
end
  if $ownbtc.to_f > 0
  print "Current BTC holdings Value: $#{$amountbtc_r} "
  puts "(#{moneysymbol}#{$earninsbtc_r.to_s})".colorize(:black).on_yellow
else
end
if $ownbch.to_f > 0
  print "Current BCH holdings Value: $#{$amountbch_r} "
  puts "(#{moneysymbol}#{$earninsbch_r.to_s})".colorize(:black).on_blue
else
end
if $ownltc.to_f > 0
  print "Current LTC holdings Value: $#{$amountltc_r} "
  puts "(#{moneysymbol}#{$earninsltc_r.to_s})".colorize(:black).on_white
else
end
if $owndoge.to_f > 0
  print "Current DOGE holdings Value: $#{$amountdoge_r} "
  puts "(#{moneysymbol}#{$earninsdoge_r.to_s})".colorize(:black).on_red
else
end
if $ownxlm.to_f > 0
  print "Current XLM holdings Value: $#{$amountxlm_r} "
  puts "(#{moneysymbol}#{$earninsxlm_r.to_s})".colorize(:black).on_green
else
end
if $ownbat.to_f > 0
  print "current BAT holdings Value: $#{$amountbat_r} "
  puts "(#{moneysymbol}#{$earninsbat_r.to_s})".colorize(:black).on_cyan
else
end
if $owneth.to_f > 0
  print "Current ETH holdings Value: $#{$amounteth_r} "
  puts "(#{moneysymbol}#{$earninseth_r.to_s})".colorize(:black).on_magenta
else
end
if $ownsol.to_f > 0
  print "Current SOL holdings Value: $#{$amountsol_r} "
  puts "(#{moneysymbol}#{$earninssol_r.to_s})".colorize(:black).on_light_yellow
else
end
if $ownada.to_f > 0
  print "current ADA holdings Value: $#{$amountada_r} "
  puts "(#{moneysymbol}#{$earninsada_r.to_s})".colorize(:black).on_light_blue
else
end
if $ownlrc.to_f > 0
  print "current LRC holdings Value: $#{$amountlrc_r} "
  puts "(#{moneysymbol}#{$earninslrc_r.to_s})".colorize(:black).on_light_magenta
else
end
if $ownamp.to_f > 0
  print "current AMP holdings Value: $#{$amountamp_r} "
  puts "(#{moneysymbol}#{$earninsamp_r.to_s})".colorize(:black).on_light_red
else
end
if $ownskl.to_f > 0
  print "current SKL holdings Value: $#{$amountskl_r} "
  puts "(#{moneysymbol}#{$earninsskl_r.to_s})".colorize(:black).on_light_green
else
end
if $owngrt.to_f > 0
  print "current GRT holdings Value: $#{$amountgrt_r} "
  puts "(#{moneysymbol}#{$earninsgrt_r.to_s})".colorize(:black).on_light_green
else
end
  if $ownbtc.to_f > 0
  print "Current #{moneysymbol}BTC: #{moneysymbol}#{$pricebtc_r} ".yellow
  if $pricebtc_r >= $breakevenbtc_r
  puts "Break-Even: #{moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_green.underline
elsif $pricebtc_r == $breakevenbtc_r
  puts "Break-Even: #{moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even: #{moneysymbol}#{$breakevenbtc_r}".colorize(:black).on_red.underline
end
else
end
if $ownbch.to_f > 0
  print "Current #{moneysymbol}BCH: #{moneysymbol}#{$pricebch_r} ".blue
  if $pricebch_r >= $breakevenbch_r
  puts "Break-Even BCH: #{moneysymbol}#{$breakevenbch_r}".colorize(:black).on_green.underline
elsif $pricebch_r == $breakevenbch_r
  puts "Break-Even BCH: #{moneysymbol}#{$breakevenbch_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even BCH: #{moneysymbol}#{$breakevenbch_r}".colorize(:black).on_red.underline
end
else
end
if $ownltc.to_f > 0
  print "Current #{moneysymbol}LTC: #{moneysymbol}#{$priceltc_r} ".white
  if $priceltc_r >= $breakevenltc_r
  puts "Break-Even LTC: #{moneysymbol}#{$breakevenltc_r}".colorize(:black).on_green.underline
elsif $priceltc_r == $breakevenltc_r
  puts "Break-Even LTC: #{moneysymbol}#{$breakevenltc_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even LTC: #{moneysymbol}#{$breakevenltc_r}".colorize(:black).on_red.underline
end
else
end
if $owndoge.to_f > 0
  print "Current #{moneysymbol}DOGE: #{moneysymbol}#{$pricedoge_r} ".red
  if $pricedoge_r >= $breakevendoge_r
  puts "Break-Even DOGE: #{moneysymbol}#{$breakevendoge_r}".colorize(:black).on_green.underline
elsif $pricedoge_r == $breakevendoge_r
  puts "Break-Even DOGE: #{moneysymbol}#{$breakevendoge_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even DOGE: #{moneysymbol}#{$breakevendoge_r}".colorize(:black).on_red.underline
end
else
end
if $ownxlm.to_f > 0
  print "Current #{moneysymbol}XLM: #{moneysymbol}#{$pricexlm_r} ".green
  if $pricexlm_r >= $breakevenxlm_r
  puts "Break-Even XLM: #{moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_green.underline
elsif $pricexlm_r == $breakevenxlm_r
  puts "Break-Even XLM: #{moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even XLM: #{moneysymbol}#{$breakevenxlm_r}".colorize(:black).on_red.underline
end
else
end
if $ownbat.to_f > 0
  print "Current #{moneysymbol}BAT: #{moneysymbol}#{$pricebat_r} ".cyan
  if $pricebat_r >= $breakevenbat_r
  puts "Break-Even BAT: #{moneysymbol}#{$breakevenbat_r}".colorize(:black).on_green.underline
elsif $pricebat_r == $breakevenbat_r
    puts "Break-Even BAT: #{moneysymbol}#{$breakevenbat_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even BAT: #{moneysymbol}#{$breakevenbat_r}".colorize(:black).on_red.underline
end
else
end
if $owneth.to_f > 0
  print "Current #{moneysymbol}ETH: #{moneysymbol}#{$priceeth_r} ".magenta
  if $priceeth_r >= $breakeveneth_r
  puts "Break-Even ETH: #{moneysymbol}#{$breakeveneth_r}".colorize(:black).on_green.underline
elsif $priceeth_r == $breakeveneth_r
  puts "Break-Even ETH: #{moneysymbol}#{$breakeveneth_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even ETH: #{moneysymbol}#{$breakeveneth_r}".colorize(:black).on_red.underline
end
else
end
if $ownsol.to_f > 0
  print "Current #{moneysymbol}SOL: #{moneysymbol}#{$pricesol_r} ".light_yellow
  if $pricesol_r >= $breakevensol_r
  puts "Break-Even SOL: #{moneysymbol}#{$breakevensol_r}".colorize(:black).on_green.underline
elsif $pricesol_r == $breakevensol_r
  puts "Break-Even SOL: #{moneysymbol}#{$breakevensol_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even SOL: #{moneysymbol}#{$breakevensol_r}".colorize(:black).on_red.underline
end
else
end
if $ownada.to_f > 0
  print "Current #{moneysymbol}ADA: #{moneysymbol}#{$priceada_r} ".light_blue
  if $priceada_r >= $breakevenada_r
  puts "Break-Even ADA: #{moneysymbol}#{$breakevenada_r}".colorize(:black).on_green.underline
elsif $priceada_r == $breakevenada_r
  puts "Break-Even ADA: #{moneysymbol}#{$breakevenada_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even ADA: #{moneysymbol}#{$breakevenada_r}".colorize(:black).on_red.underline
end
else
end
if $ownlrc.to_f > 0
  print "Current #{moneysymbol}LRC: #{moneysymbol}#{$pricelrc_r} ".light_magenta
  if $pricelrc_r >= $breakevenlrc_r
  puts "Break-Even LRC: #{moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_green.underline
elsif $pricelrc_r == $breakevenlrc_r
  puts "Break-Even LRC: #{moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even LRC: #{moneysymbol}#{$breakevenlrc_r}".colorize(:black).on_red.underline
end
else
end
if $ownamp.to_f > 0
  print "Current #{moneysymbol}AMP: #{moneysymbol}#{$priceamp_r} ".light_red
  if $priceamp_r >= $breakevenamp_r
  puts "Break-Even AMP: #{moneysymbol}#{$breakevenamp_r}".colorize(:black).on_green.underline
elsif $priceamp_r == $breakevenamp_r
  puts "Break-Even AMP: #{moneysymbol}#{$breakevenamp_r}".colorize(:black).on_yellow.underline
else
  puts "Break-Even AMP: #{moneysymbol}#{$breakevenamp_r}".colorize(:black).on_red.underline
end
else
end
if $ownskl.to_f > 0
  print "Current #{moneysymbol}SKL #{moneysymbol}#{$priceskl_r} ".light_green
  if $priceskl_r >= $breakevenskl_r
    puts "Break-Even SKL: #{moneysymbol}#{$breakevenskl_r}".colorize(:black).on_green.underline
  elsif $priceskl_r == $breakevenskl_r
    puts "Break-Even SKL: #{moneysymbol}#{$breakevenskl_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even SKL: #{moneysymbol}#{$breakevenskl_r}".colorize(:black).on_red.underline
  end
else
end
if $owngrt.to_f > 0
  print "Current #{moneysymbol}GRT #{moneysymbol}#{$pricegrt_r} ".light_green
  if $pricegrt_r >= $breakevengrt_r
    puts "Break-Even GRT: #{moneysymbol}#{$breakevengrt_r}".colorize(:black).on_green.underline
  elsif $pricegrt_r == $breakevengrt_r
    puts "Break-Even GRT: #{moneysymbol}#{$breakevengrt_r}".colorize(:black).on_yellow.underline
  else
    puts "Break-Even GRT: #{moneysymbol}#{$breakevengrt_r}".colorize(:black).on_red.underline
  end
else
end
end
def advanceoutput
if $currency == 3
    moneysymbol = "$"
elsif $currency == 2
    moneysymbol = "₽"
else
  moneysymbol = "€"
end
if $totalearnins >= 0
  print "Total Gains: "
  puts "#{moneysymbol}#{$totalearnins.to_s}".colorize(:black).on_green.underline
  print "Total Spent: "
  puts "#{moneysymbol}#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{moneysymbol}#{$totalvalue.to_s}".colorize(:black).on_green.underline
  print "Precentage Gains: "
  puts "#{$precentage}%"
else
  print "Total losses: "
  puts "#{moneysymbol}#{$totalearnins.to_s}".colorize(:white).on_red.underline
  print "Total Spent: "
  puts "#{moneysymbol}#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{moneysymbol}#{$totalvalue.to_s}".colorize(:black).on_green.underline
  print "Precentage loss: "
  puts "#{$precentage}%"
end
end
def btctrending
  if $pricebtc_f > $oldpricebtc
    puts "BTC trending up #{$btcpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebtc_f < $oldpricebtc
    puts "BTC trending down #{$btcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BTC Price has not changed"
  end
end

def bchtrending
  if $pricebch_f > $oldpricebch
    puts "BCH trending up #{$bchpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebch_f < $oldpricebch
    puts "BCH trending down #{$bchpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BCH price has not changed"
  end
end

def ltctrending
  if $priceltc_f > $oldpriceltc
    puts "LTC trending up #{$ltcpchange_r}%".colorize(:green).on_black.blink
  elsif $priceltc_f < $oldpriceltc
    puts "LTC trending down #{$ltcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "LTC price has not changed"
  end
end

def dogetrending
  if $pricedoge_f > $oldpricedoge
    puts "DOGE trending up #{$dogepchange_r}%".colorize(:green).on_black.blink
  elsif $pricedoge_f < $oldpricedoge
    puts "DOGE trending down #{$dogepchange_r}%".colorize(:red).on_black.blink
  else
    puts "DOGE price has not changed"
  end
end

def ethtrending
  if $priceeth_f > $oldpriceeth
    puts "ETH trending up #{$ethpchange_r}%".colorize(:green).on_black.blink
  elsif $priceeth_f < $oldpriceeth
    puts "ETH trending down #{$ethpchange_r}%".colorize(:red).on_black.blink
  else
    puts "ETH price has not changed"
  end
end
def battrending
  if $pricebat_f > $oldpricebat
    puts "BAT trending up #{$batpchange_r}%".colorize(:green).on_black.blink
  elsif $pricebat_f < $oldpricebat
    puts "BAT trending down #{$batpchange_r}%".colorize(:red).on_black.blink
  else
    puts "BAT price has not changed"
  end
end
def soltrending
  if $pricesol_f > $oldpricesol
    puts "SOL trending up #{$solpchange_r}%".colorize(:green).on_black.blink
  elsif $pricesol_f < $oldpricesol
    puts "SOL trending down #{$solpchange_r}%".colorize(:red).on_black.blink
  else
    puts "SOL price has not changed"
  end
end
def adatrending
  if $priceada_f > $oldpriceada
    puts "ADA trending up #{$adapchange_r}%".colorize(:green).on_black.blink
  elsif $priceada_f < $oldpriceada
    puts "ADA trending down #{$adapchange_r}%".colorize(:red).on_black.blink
  else
    puts "ADA price has not changed"
  end
end
def lrctrending
  if $pricelrc_f > $oldpricelrc
    puts "LRC trending up #{$lrcpchange_r}%".colorize(:green).on_black.blink
  elsif $pricelrc_f < $oldpricelrc
    puts "LRC trending down #{$lrcpchange_r}%".colorize(:red).on_black.blink
  else
    puts "LRC price has not changed"
  end
end
def xlmtrending
  if $pricexlm_f > $oldpricexlm
    puts "XLM trending up #{$xlmpchange_r}%".colorize(:green).on_black.blink
  elsif $pricexlm_f < $oldpricexlm
    puts "XLM trending down #{$xlmpchange_r}%".colorize(:red).on_black.blink
  else
    puts "XLM price has not changed"
  end
end
def amptrending
  if $priceamp_f > $oldpriceamp
    puts "AMP trending up #{$amppchange_r}%".colorize(:green).on_black.blink
  elsif $priceamp_f < $oldpriceamp
    puts "AMP trending down #{$amppchange_r}%".colorize(:red).on_black.blink
  else
    puts "AMP price has not changed"
  end
end
def skltrending
  if $priceskl_f > $oldpriceskl
    puts "SKL trending up #{$sklpchange_r}%".colorize(:green).on_black.blink
  elsif $priceskl_f < $oldpriceskl
    puts "SKL trending down #{$sklpchange_r}%".colorize(:red).on_black.blink
  else
    puts "SKL price has not changed"
  end
end
def grttrending
  if $pricegrt_f > $oldpricegrt
    puts "GRT trending up #{$grtpchange_r}%".colorize(:green).on_black.blink
  elsif $pricegrt_f < $oldpricegrt
    puts "GRT trending down #{$grtpchange_r}%".colorize(:red).on_black.blink
  else
    puts "GRT price has not changed"
  end
end
def trendingclose
    time = Time.new
    $ltc = time.strftime("%Y-%m-%d-%H:%M:%S")
    puts "Last update #{$ltc}"
    File.open('cryptopricedata.txt', 'w') {|f| f.write($serialized_array) }
end
def logging
  CSV.open("#{$dataset}-logging.csv", "ab") do |csv|
  csv << ["#{$ltc}","#{$currency}","#{$pricebtc_f}","#{$amountbtc_r}","#{$btcpchange_r}","#{$pricebch_f}","#{$amountbch_r}","#{$bchpchange_r}","#{$priceltc_f}","#{$amountltc_r}","#{$ltcpchange_r}","#{$pricedoge_f}","#{$amountdoge_r}","#{$dogepchange_r}","#{$pricexlm_f}","#{$amountxlm_r}","#{$xlmpchange_r}","#{$pricebat_f}","#{$amountbat_r}","#{$batpchange_r}","#{$priceeth_f}","#{$amounteth_r}","#{$ethpchange_r}","#{$pricesol_f}","#{$amountsol_r}","#{$solpchange_r}","#{$priceada_f}","#{$amountada_r}","#{$adapchange_r}","#{$pricelrc_f}","#{$amountlrc_r}","#{$lrcpchange_r}","#{$priceamp_f}","#{$amountamp_r}","#{$amppchange_r}","#{$priceskl_f}","#{$amountskl_r}","#{$sklpchange_r}","#{$pricegrt_f}","#{$amountgrt_r}","#{$grtpchange_r}","#{$totalearnins}","#{$precentage}%"]
end
end

def notifications
  if $currency == 3
    moneysymbol = "$"
  elsif $currency == 2
    moneysymbol = "₽"
  else
    moneysymbol = "€"
  end
if $n == 10
  NotifySend.send "CryptoWatchDash","Total earnins #{$totalearnins.to_s} Total H#{moneysymbol} #{$totalvalue} H#{moneysymbol} % Change (#{$precentage}%)","info",500
  $n = 0
else
end
end

def convert
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
  $totalspent = ($spentbtc + $spentbch + $spentltc + $spentdoge + $spentxlm + $spentbat + $spenteth + $spentsol + $spentada + $spentlrc + $spentamp + $spentskl)
end

$k = 1
$n = 0
puts "enable notifications? (y/n)"
$noti = gets.chomp
$sourcecur = 0
until $sourcecur == 1 || $sourcecur == 2 || $sourcecur == 3 do
puts "what is source Currency? (1 for EUR, 2 for RUB, 3 for USD)"
$sourcecur = gets.to_i
$currency = $sourcecur.to_i
end
puts "would you like to enable logging? (y/n)"
$logging = gets.chomp
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
elsif control == "n" && $noti == "y"
  $noti = "n"
  puts "notifications off"
  control = gets.chomp
elsif control == "n" && $noti == "n"
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
elsif control == "l" && $logging == "y"
  $logging = "n"
  puts "Logging Disabled"
  control = gets.chomp
elsif control == "l" && $logging == "n"
  $logging = "y"
  puts "Logging Enabled"
  control = gets.chomp
else
  puts "unknown key, please try again."
  control = gets.chomp
end
end}
prices
$loading = 1
sleep 2
while $k == 1 do
convert
basicoutput
advanceoutput
puts "\n"
if $ownbtc.to_f > 0
  btctrending
else
end
if $ownbch.to_f > 0
  bchtrending
else
end
if $ownltc.to_f > 0
  ltctrending
else
end
if $owndoge.to_f > 0
  dogetrending
else
end
if $owneth.to_f > 0
  ethtrending
else
end
if $ownbat.to_f > 0
  battrending
else
end
if $ownsol.to_f > 0
  soltrending
else
end
if $ownada.to_f > 0
  adatrending
else
end
if $ownlrc.to_f > 0
  lrctrending
else
end
if $ownxlm.to_f > 0
  xlmtrending
else
end
if $ownamp.to_f > 0
  amptrending
else
end
if $ownskl.to_f > 0
  skltrending
else
end
if $owngrt.to_f > 0
  grttrending
else
end
trendingclose
if $logging == "y"
  logging
else
end
if $noti == "y"
notifications
$n += 1
else
end
puts " "
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
if $k == 1
  prices
else
end
end
