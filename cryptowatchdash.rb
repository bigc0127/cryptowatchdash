#!/usr/bin/env ruby
require 'colorize'
require 'csv'
def setup
  $time = 10
  $dataset = "cryptodata.txt"
  file = File.open("#{$dataset}")
  file_data = file.readlines.map(&:chomp)
  ownbtcraw = file_data[1]
  $ownbtc = ownbtcraw.to_f
  $oldpricebtc = 1
  $oldmoneybtc = 0
  spentbtcraw = file_data[3]
  $spentbtc = spentbtcraw.to_f
  ownbchraw = file_data[5]
  $ownbch = ownbchraw.to_f
  $oldpricebch = 1
  $oldmoneybch = 0
  spentbchraw = file_data[7]
  $spentbch = spentbchraw.to_f
  ownltcraw = file_data[9]
  $ownltc = ownltcraw.to_f
  $oldpriceltc = 1
  $oldmoneyltc = 0
  spentltcraw = file_data[11]
  $spentltc = spentltcraw.to_f

  owndogeraw = file_data[13]
  $owndoge = owndogeraw.to_f
  $oldpricedoge = 1
  $oldmoneydoge = 0
  spentdogeraw = file_data[15]
  $spentdoge = spentdogeraw.to_f

  ownxlmraw = file_data[17]
  $ownxlm = ownxlmraw.to_f
  $oldpricexlm = 1
  $oldmoneyxlm = 0
  spentxlmraw = file_data[19]
  $spentxlm = spentxlmraw.to_f

  ownbatraw = file_data[21]
  $ownbat = ownbatraw.to_f
  $oldpricebat = 1
  $oldmoneybat = 0
  spentbatraw = file_data[23]
  $spentbat = spentbatraw.to_f

  ownethraw = file_data[25]
  $owneth = ownethraw.to_f
  $oldpriceeth = 1
  $oldmoneyeth = 0
  spentethraw = file_data[27]
  $spenteth = spentethraw.to_f

  ownsolraw = file_data[29]
  $ownsol = ownsolraw.to_f
  $oldpricesol = 1
  $oldmoneysol = 0
  spentsolraw = file_data[31]
  $spentsol = spentsolraw.to_f

  ownadaraw = file_data[33]
  $ownada = ownadaraw.to_f
  $oldpriceada = 1
  $oldmoneyada = 0
  spentadaraw = file_data[35]
  $spentada = spentadaraw.to_f

  ownlrcraw = file_data[37]
  $ownlrc = ownlrcraw.to_f
  $oldpricelrc = 1
  $oldmoneylrc = 0
  spentlrcraw = file_data[39]
  $spentlrc = spentlrcraw.to_f

  $cryptopricedata = Array.new(9)
end
def prices
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

      $pricebtc_r = $pricebtc_f.round(3)
      $pricebch_r = $pricebch_f.round(3)
      $priceltc_r = $priceltc_f.round(3)
      $pricedoge_r = $pricedoge_f.round(3)
      $pricexlm_r = $pricexlm_f.round(3)
      $pricebat_r = $pricebat_f.round(3)
      $priceeth_r = $priceeth_f.round(3)
      $pricesol_r = $pricesol_f.round(3)
      $priceada_r = $priceada_f.round(3)
      $pricelrc_r = $pricelrc_f.round(3)

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

      $breakevenbtc_r = breakevenbtc.round(2)
      $breakevenbch_r = breakevenbch.round(2)
      $breakevenltc_r = breakevenltc.round(2)
      $breakevendoge_r = breakevendoge.round(2)
      $breakevenxlm_r = breakevenxlm.round(2)
      $breakevenbat_r = breakevenbat.round(2)
      $breakeveneth_r = breakeveneth.round(2)
      $breakevensol_r = breakevensol.round(2)
      $breakevenada_r = breakevenada.round(2)
      $breakevenlrc_r = breakevenlrc.round(2)

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

      $totalearnins = ($earninsbtc_r + $earninsbch_r + $earninsltc_r + $earninsdoge_r + $earninsxlm_r + $earninsbat_r + $earninseth_r + $earninssol_r + $earninsada_r + $earninslrc_r).round(2)
      $totalvalue  = ($amountbtc_r + $amountbch_r + $amountltc_r + $amountdoge_r + $amountxlm_r + $earninsbat_r + $earninseth_r + $earninssol_r + $earninsada_r + $earninslrc_r).round(2)
      $totalspent = ($spentbtc + $spentbch + $spentltc + $spentdoge + $spentxlm + $spentbat + $spenteth + $spentsol + $spentada + $spentlrc)

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

      $precentage = $precentage.round(2)
      $serialized_array = Marshal.dump($cryptopricedata)
end
def basicoutput
  system "clear"
  puts "###### #{$dataset} ######"
  puts "###### By Connor W. Needling ######"
  puts "###### Version 1.7.7.6 (Indinapolis, IN)######"
  if $ownbtc.to_f > 0
  print "spent "
  print "$#{$spentbtc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbtc.to_s}".colorize(:black).on_yellow
  puts " BTC"
else
end
if $ownbch.to_f > 0
  print "spent "
  print "$#{$spentbch.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbch.to_s}".colorize(:black).on_yellow
  puts " BCH"
else
end
if $ownltc.to_f > 0
  print "spent "
  print "$#{$spentltc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownltc.to_s}".colorize(:black).on_yellow
  puts " LTC"
else
end
if $owndoge.to_f > 0
  print "spent "
  print "$#{$spentdoge.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owndoge.to_s}".colorize(:black).on_yellow
  puts " DOGE"
else
end
if $ownxlm.to_f > 0
  print "spent "
  print "$#{$spentxlm.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownxlm.to_s}".colorize(:black).on_yellow
  puts " XLM"
else
end
if $ownbat.to_f > 0
  print "spent "
  print "$#{$spentbat.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownbat.to_s}".colorize(:black).on_yellow
  puts " BAT"
else
end
if $owneth.to_f > 0
  print "spent "
  print "$#{$spenteth.to_s}".colorize(:black).on_green
  print " on "
  print "#{$owneth.to_s}".colorize(:black).on_yellow
  puts " ETH"
else
end
if $ownsol.to_f > 0
  print "spent "
  print "$#{$spentsol.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownsol.to_s}".colorize(:black).on_yellow
  puts " SOL"
else
end
if $ownada.to_f > 0
  print "spent "
  print "$#{$spentada.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownada.to_s}".colorize(:black).on_yellow
  puts " ADA"
else
end
if $ownlrc.to_f > 0
  print "spent "
  print "$#{$spentlrc.to_s}".colorize(:black).on_green
  print " on "
  print "#{$ownlrc.to_s}".colorize(:black).on_yellow
  puts " LRC"
else
end
  if $ownbtc.to_f > 0
  print "Current BTC holdings Value: $#{$amountbtc_r} "
  puts "($#{$earninsbtc_r.to_s})".colorize(:yellow).on_black.underline
else
end
if $ownbch.to_f > 0
  print "Current BCH holdings Value: $#{$amountbch_r} "
  puts "($#{$earninsbch_r.to_s})".colorize(:blue).on_black.underline
else
end
if $ownltc.to_f > 0
  print "Current LTC holdings Value: $#{$amountltc_r} "
  puts "($#{$earninsltc_r.to_s})".colorize(:white).on_black.underline
else
end
if $owndoge.to_f > 0
  print "Current DOGE holdings Value: $#{$amountdoge_r} "
  puts "($#{$earninsdoge_r.to_s})".colorize(:red).on_black.underline
else
end
if $ownxlm.to_f > 0
  print "Current XLM holdings Value: $#{$amountxlm_r} "
  puts "($#{$earninsxlm_r.to_s})".colorize(:green).on_black.underline
else
end
if $ownbat.to_f > 0
  print "current BAT holdings Value: $#{$amountbat_r} "
  puts "($#{$earninsbat_r.to_s})".colorize(:cyan).on_black.underline
else
end
if $owneth.to_f > 0
  print "Current ETH holdings Value: $#{$amounteth_r} "
  puts "($#{$earninseth_r.to_s})".colorize(:magenta).on_black.underline
else
end
if $ownsol.to_f > 0
  print "Current SOL holdings Value: $#{$amountsol_r} "
  puts "($#{$earninssol_r.to_s})".colorize(:light_yellow).on_black.underline
else
end
if $ownada.to_f > 0
  print "current ADA holdings Value: $#{$amountada_r} "
  puts "($#{$earninsada_r.to_s})".colorize(:light_blue).on_black.underline
else
end
if $ownlrc.to_f > 0
  print "current LRC holdings Value: $#{$amountlrc_r} "
  puts "($#{$earninslrc_r.to_s})".colorize(:light_magenta).on_black.underline
else
end
  if $ownbtc.to_f > 0
  print "Current $BTC: $#{$pricebtc_r} ".yellow
  puts "Break-Even: $#{$breakevenbtc_r}".colorize(:black).on_red.underline
else
end
if $ownbch.to_f > 0
  print "Current $BCH: $#{$pricebch_r} ".blue
  puts "Break-Even BCH: $#{$breakevenbch_r}".colorize(:black).on_red.underline
else
end
if $ownltc.to_f > 0
  print "Current $LTC: $#{$priceltc_r} ".white
  puts "Break-Even LTC: $#{$breakevenltc_r}".colorize(:black).on_red.underline
else
end
if $owndoge.to_f > 0
  print "Current $DOGE: $#{$pricedoge_r} ".red
  puts "Break-Even DOGE: $#{$breakevendoge_r}".colorize(:black).on_red.underline
else
end
if $ownxlm.to_f > 0
  print "Current $XLM: $#{$pricexlm_r} ".green
  puts "Break-Even XLM: $#{$breakevenxlm_r}".colorize(:black).on_red.underline
else
end
if $ownbat.to_f > 0
  print "Current $BAT: $#{$pricebat_r} ".cyan
  puts "Break-Even BAT: $#{$breakevenbat_r}".colorize(:black).on_red.underline
else
end
if $owneth.to_f > 0
  print "Current $ETH: $#{$priceeth_r} ".magenta
  puts "Break-Even ETH: $#{$breakeveneth_r}".colorize(:black).on_red.underline
else
end
if $ownsol.to_f > 0
  print "Current $SOL: $#{$pricesol_r} ".light_yellow
  puts "Break-Even SOL: $#{$breakevensol_r}".colorize(:black).on_red.underline
else
end
if $ownada.to_f > 0
  print "Current $ADA: $#{$priceada_r} ".light_blue
  puts "Break-Even ADA: $#{$breakevenada_r}".colorize(:black).on_red.underline
else
end
if $ownlrc.to_f > 0
  print "Current $LRC: $#{$pricelrc_r} ".light_magenta
  puts "Break-Even LRC: $#{$breakevenlrc_r}".colorize(:black).on_red.underline
else
end
end
def advanceoutput
  if $totalearnins >= 0
  print "Total Gains: "
  puts "#{$totalearnins.to_s}".colorize(:black).on_green.underline
  print "Total Spent: "
  puts "#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{$totalvalue.to_s}".colorize(:black).on_green.underline
  print "Precentage Gains: "
  puts "#{$precentage}%"
else
  print "Total losses: "
  puts "#{$totalearnins.to_s}".colorize(:white).on_red.underline
  print "Total Spent: "
  puts "#{$totalspent.round(2)}"
  print "Total Value: "
  puts "#{$totalvalue.to_s}".colorize(:black).on_green.underline
  print "Precentage loss: "
  puts "#{$precentage}%"
end
end
def btctrending
  if $pricebtc_f >= $oldpricebtc
    puts "BTC trending up #{$btcpchange_r}%".colorize(:green).on_black.blink
  else
    puts "BTC trending down #{$btcpchange_r}%".colorize(:red).on_black.blink
  end
end

def bchtrending
  if $pricebch_f >= $oldpricebch
    puts "BCH trending up #{$bchpchange_r}%".colorize(:green).on_black.blink
  else
    puts "BCH trending down #{$bchpchange_r}%".colorize(:red).on_black.blink
  end
end

def ltctrending
  if $priceltc_f >= $oldpriceltc
    puts "LTC trending up #{$ltcpchange_r}%".colorize(:green).on_black.blink
  else
    puts "LTC trending down #{$ltcpchange_r}%".colorize(:red).on_black.blink
  end
end

def dogetrending
  if $pricedoge_f >= $oldpricedoge
    puts "DOGE trending up #{$dogepchange_r}%".colorize(:green).on_black.blink
  else
    puts "DOGE trending down #{$dogepchange_r}%".colorize(:red).on_black.blink
  end
end

def ethtrending
  if $priceeth_f >= $oldpriceeth
    puts "ETH trending up #{$ethpchange_r}%".colorize(:green).on_black.blink
  else
    puts "ETH trending down #{$ethpchange_r}%".colorize(:red).on_black.blink
  end
end
def battrending
  if $pricebat_f >= $oldpricebat
    puts "BAT trending up #{$batpchange_r}%".colorize(:green).on_black.blink
  else
    puts "BAT trending down #{$batpchange_r}%".colorize(:red).on_black.blink
  end
end
def soltrending
  if $pricesol_f >= $oldpricesol
    puts "SOL trending up #{$solpchange_r}%".colorize(:green).on_black.blink
  else
    puts "SOL trending down #{$solpchange_r}%".colorize(:red).on_black.blink
  end
end
def adatrending
  if $priceada_f >= $oldpriceada
    puts "ADA trending up #{$adapchange_r}%".colorize(:green).on_black.blink
  else
    puts "ADA trending down #{$adapchange_r}%".colorize(:red).on_black.blink
  end
end
def lrctrending
  if $pricelrc_f >= $oldpricelrc
    puts "LRC trending up #{$lrcpchange_r}%".colorize(:green).on_black.blink
  else
    puts "LRC trending down #{$lrcpchange_r}%".colorize(:red).on_black.blink
  end
end
def xlmtrending
  if $pricexlm_f >= $oldpricexlm
    puts "XLM trending up #{$xlmpchange_r}%".colorize(:green).on_black.blink

  else
    puts "XLM trending down #{$xlmpchange_r}%".colorize(:red).on_black.blink
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
  csv << ["#{$ltc}","#{$pricebtc_f}","#{$amountbtc_r}","#{$btcpchange_r}","#{$pricebch_f}","#{$amountbch_r}","#{$bchpchange_r}","#{$priceltc_f}","#{$amountltc_r}","#{$ltcpchange_r}","#{$pricedoge_f}","#{$amountdoge_r}","#{$dogepchange_r}","#{$pricexlm_f}","#{$amountxlm_r}","#{$xlmpchange_r}","#{$pricebat_f}","#{$amountbat_r}","#{$batpchange_r}","#{$priceeth_f}","#{$amounteth_r}","#{$ethpchange_r}","#{$pricesol_f}","#{$amountsol_r}","#{$solpchange_r}","#{$priceada_f}","#{$amountada_r}","#{$adapchange_r}","#{$pricelrc_f}","#{$amountlrc_r}","#{$lrcpchange_r}","#{$totalearnins}","#{$precentage}%"]
end
end
$k = 1
setup
system "clear"
puts "Loading crypto Prices....."
prices
while $k == 1 do
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
trendingclose
logging
sleep ($time)
prices
end
