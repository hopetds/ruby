#!/usr/bin/env ruby
#creating hash key:value
buckets = { red: 50, green: 100, blue: 30, yellow: 60}
puts "Which bucket has more globes?"
#get max values using hash.values.max, then get its key hash.key and print
puts buckets.key buckets.values.max
puts "Green bucket has more globes than yellow or red + blue?"
if (buckets[:green] > buckets[:yellow]) || (buckets[:green] > (buckets[:red] + buckets[:blue]))
	puts true
else
	puts false
end
#if (green > yellow) || (green >(red + green)) then puts "Yes it is" else puts "NO" end