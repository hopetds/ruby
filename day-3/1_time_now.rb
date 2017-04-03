#!/usr/bin/env ruby
#simple loop to give elapsed method some time
elapsed_find = Proc.new do
  a = []
  (1..5555).each { |i| if i%2 == 0 and i != 2 then a << i end}
end
#
def elapsed (arg)
	starttime = Time.now
	arg.call
        elapsed_time = Time.now - starttime
end
puts "Its not a benchmark, but time elapsed is : #{elapsed(elapsed_find)}"
