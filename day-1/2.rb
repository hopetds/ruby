#!/usr/bin/env ruby
kurs = 11170
sbor = 0.3
needed = 270
sum = (needed * (kurs + (sbor * kurs)))
#1st task
puts "How much BLR i need to buy 270$?\n#{sum}"
#2d task
bank = 5600000
ice_cream = 10000
change = (bank % (kurs + (sbor * kurs))).to_i
bucks = (bank / (kurs + (sbor * kurs))).to_i
puts "I have #{bank} BLR. Lets buy some bucks!\nOk, now i have #{bucks} $ and only #{change} BLR. Is it enough to buy an ice-cream?"
if change > ice_cream then puts "Yeah, Its enough" else puts "Ah.. Its not enough" end