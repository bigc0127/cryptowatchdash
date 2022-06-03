#!/usr/bin/env ruby
require 'colorize'
require_relative 'core'
start = Loading.new('cryptodata.txt')
start.input
coref = Core.new
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
coref.prices
$loading = 1
sleep 2
k = 1
$run = 0
until k == 2 do
  system "clear"
  if $bitcoin.owns.to_f > 0
  puts "=======BitCoin=======".colorize(:black).on_white
  puts "current bitcoin price is #{$price[0].to_s}"
  puts "you own #{$bitcoin.owns.to_s}"
  puts "you spent #{$bitcoin.spent}"
  puts "your break even point is  #{$bitcoin.breakeven.to_s}"
  if $price[0] >= $bitcoin.breakeven
    puts "your total gains are : #{$bitcoin.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$bitcoin.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $bitcoin.trending
else end
  puts "timestamp:#{$btct}".colorize(:black).on_light_cyan
else end

  if $bitcoincash.owns.to_f > 0
  puts "=======BitCoin Cash=======".colorize(:black).on_white
  puts "current bitcoincash price is #{$price[1].to_s}"
  puts "you own #{$bitcoincash.owns.to_s}"
  puts "you spent #{$bitcoincash.spent}"
  puts "your break even point is  #{$bitcoincash.breakeven.to_s}"
  if $price[1] >= $bitcoincash.breakeven
    puts "your total gains are : #{$bitcoincash.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$bitcoincash.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $bitcoincash.trending
else end
  puts "timestamp:#{$bcht}".colorize(:black).on_light_cyan
else end

if $litecoin.owns.to_f > 0
  puts "=======litecoin=======".colorize(:black).on_white
  puts "current litecoin price is #{$price[2].to_s}"
  puts "you own #{$litecoin.owns.to_s}"
  puts "you spent #{$litecoin.spent}"
  puts "your break even point is  #{$litecoin.breakeven.to_s}"
  if $price[2] >= $litecoin.breakeven
    puts "your total gains are : #{$litecoin.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$litecoin.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $litecoin.trending
else end
  puts "timestamp:#{$ltct}".colorize(:black).on_light_cyan
else end

if $dogecoin.owns.to_f > 0
  puts "=======dogecoin=======".colorize(:black).on_white
  puts "current dogecoin price is #{$price[3].to_s}"
  puts "you own #{$dogecoin.owns.to_s}"
  puts "you spent #{$dogecoin.spent}"
  puts "your break even point is  #{$dogecoin.breakeven.to_s}"
  if $price[3] >= $dogecoin.breakeven
    puts "your total gains are : #{$dogecoin.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$dogecoin.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $dogecoin.trending
else end
  puts "timestamp:#{$doget}".colorize(:black).on_light_cyan
else end


if $stellarlumans.owns.to_f > 0
  puts "=======stellarlumans=======".colorize(:black).on_white
  puts "current stellarlumans price is #{$price[4].to_s}"
  puts "you own #{$stellarlumans.owns.to_s}"
  puts "you spent #{$stellarlumans.spent}"
  puts "your break even point is  #{$stellarlumans.breakeven.to_s}"
  if $price[4] >= $stellarlumans.breakeven
    puts "your total gains are : #{$stellarlumans.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$stellarlumans.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $stellarlumans.trending
else end
  puts "timestamp:#{$xlmt}".colorize(:black).on_light_cyan
else end

if $basicattentiontoken.owns.to_f > 0
  puts "=======basicattentiontoken=======".colorize(:black).on_white
  puts "current basicattentiontoken price is #{$price[5].to_s}"
  puts "you own #{$basicattentiontoken.owns.to_s}"
  puts "you spent #{$basicattentiontoken.spent}"
  puts "your break even point is  #{$basicattentiontoken.breakeven.to_s}"
  if $price[5] >= $basicattentiontoken.breakeven
    puts "your total gains are : #{$basicattentiontoken.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$basicattentiontoken.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $basicattentiontoken.trending
else end
  puts "timestamp:#{$batt}".colorize(:black).on_light_cyan
else end

if $ethereum.owns.to_f > 0
  puts "=======ethereum=======".colorize(:black).on_white
  puts "current ethereum price is #{$price[6].to_s}"
  puts "you own #{$ethereum.owns.to_s}"
  puts "you spent #{$ethereum.spent}"
  puts "your break even point is  #{$ethereum.breakeven.to_s}"
  if $price[6] >= $ethereum.breakeven
    puts "your total gains are : #{$ethereum.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$ethereum.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $ethereum.trending
else end
  puts "timestamp:#{$etht}".colorize(:black).on_light_cyan
else end

if $solana.owns.to_f > 0
  puts "=======solana=======".colorize(:black).on_white
  puts "current solana price is #{$price[7].to_s}"
  puts "you own #{$solana.owns.to_s}"
  puts "you spent #{$solana.spent}"
  puts "your break even point is  #{$solana.breakeven.to_s}"
  if $price[7] >= $solana.breakeven
    puts "your total gains are : #{$solana.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$solana.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $solana.trending
else end
  puts "timestamp:#{$solt}".colorize(:black).on_light_cyan
else end

if $cardano.owns.to_f > 0
  puts "=======cardano=======".colorize(:black).on_white
  puts "current cardano price is #{$price[8].to_s}"
  puts "you own #{$cardano.owns.to_s}"
  puts "you spent #{$cardano.spent}"
  puts "your break even point is  #{$cardano.breakeven.to_s}"
  if $price[8] >= $cardano.breakeven
    puts "your total gains are : #{$cardano.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$cardano.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $cardano.trending
else end
  puts "timestamp:#{$adat}".colorize(:black).on_light_cyan
else end

if $loopring.owns.to_f > 0
  puts "=======loopring=======".colorize(:black).on_white
  puts "current loopring price is #{$price[9].to_s}"
  puts "you own #{$loopring.owns.to_s}"
  puts "you spent #{$loopring.spent}"
  puts "your break even point is  #{$loopring.breakeven.to_s}"
  if $price[9] >= $loopring.breakeven
    puts "your total gains are : #{$loopring.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$loopring.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $loopring.trending
  else
  end
  puts "timestamp:#{$lrct}".colorize(:black).on_light_cyan
else end

if $amp.owns.to_f > 0
  puts "=======amp=======".colorize(:black).on_white
  puts "current amp price is #{$price[10].to_s}"
  puts "you own #{$amp.owns.to_s}"
  puts "you spent #{$amp.spent}"
  puts "your break even point is  #{$amp.breakeven.to_s}"
  if $price[10] >= $amp.breakeven
    puts "your total gains are : #{$amp.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$amp.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $amp.trending
else end
  puts "timestamp:#{$ampt}".colorize(:black).on_light_cyan
else end

if $skale.owns.to_f > 0
  puts "=======skale=======".colorize(:black).on_white
  puts "current skale price is #{$price[11].to_s}"
  puts "you own #{$skale.owns.to_s}"
  puts "you spent #{$skale.spent}"
  puts "your break even point is  #{$skale.breakeven.to_s}"
  if $price[11] >= $skale.breakeven
    puts "your total gains are : #{$skale.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$skale.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $skale.trending
else end
  puts "timestamp:#{$sklt}".colorize(:black).on_light_cyan
else end

if $thegraph.owns.to_f > 0
  puts "=======thegraph=======".colorize(:black).on_white
  puts "current thegraph price is #{$price[12].to_s}"
  puts "you own #{$thegraph.owns.to_s}"
  puts "you spent #{$thegraph.spent}"
  puts "your break even point is  #{$thegraph.breakeven.to_s}"
  if $price[12] >= $thegraph.breakeven
    puts "your total gains are : #{$thegraph.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$thegraph.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $thegraph.trending
else end
  puts "timestamp:#{$grtt}".colorize(:black).on_light_cyan
else end

if $enzyme.owns.to_f > 0
  puts "=======enzyme=======".colorize(:black).on_white
  puts "current enzyme price is #{$price[13].to_s}"
  puts "you own #{$enzyme.owns.to_s}"
  puts "you spent #{$enzyme.spent}"
  puts "your break even point is  #{$enzyme.breakeven.to_s}"
  if $price[13] >= $enzyme.breakeven
    puts "your total gains are : #{$enzyme.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$enzyme.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $enzyme.trending
else end
  puts "timestamp:#{$mlnt}".colorize(:black).on_light_cyan
else end

if $ethereum2.owns.to_f > 0
  puts "=======ethereum2=======".colorize(:black).on_white
  puts "current ethereum2 price is #{$price[14].to_s}"
  puts "you own #{$ethereum2.owns.to_s}"
  puts "you spent #{$ethereum2.spent}"
  puts "your break even point is  #{$ethereum2.breakeven.to_s}"
  if $price[14] >= $ethereum2.breakeven
    puts "your total gains are : #{$ethereum2.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$ethereum2.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $ethereum2.trending
else end
  puts "timestamp:#{$eth2t}".colorize(:black).on_light_cyan
else end

if $shibainu.owns.to_f > 0
  puts "=======shibainu=======".colorize(:black).on_white
  puts "current shibainu price is #{$price[15].to_s}"
  puts "you own #{$shibainu.owns.to_s}"
  puts "you spent #{$shibainu.spent}"
  puts "your break even point is  #{$shibainu.breakeven.to_s}"
  if $price[15] >= $shibainu.breakeven
    puts "your total gains are : #{$shibainu.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$shibainu.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $shibainu.trending
else end
  puts "timestamp:#{$shibt}".colorize(:black).on_light_cyan
else end

if $polkadot.owns.to_f > 0
  puts "=======polkadot=======".colorize(:black).on_white
  puts "current polkadot price is #{$price[16].to_s}"
  puts "you own #{$polkadot.owns.to_s}"
  puts "you spent #{$polkadot.spent}"
  puts "your break even point is  #{$polkadot.breakeven.to_s}"
  if $price[16] >= $polkadot.breakeven
    puts "your total gains are : #{$polkadot.profits.to_s}".colorize(:white).on_green
  else
    puts "your total losses are : #{$polkadot.profits.to_s}".colorize(:black).on_red
  end
  if $run > 0
  $polkadot.trending
else end
  puts "timestamp:#{$dott}".colorize(:black).on_light_cyan
else end
$run += 1
  sleep 10
  time = Time.new
  nlct = time.strftime("%Y-%m-%d-%H:%M:%S")
  puts "Price Refresh started: #{nlct}".colorize(:black).on_yellow
  coref.prices
end
