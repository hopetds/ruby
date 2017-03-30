#!/usr/bin/env ruby
fib = (0..(ARGV[0].to_i)).to_a
fib_final = []
fib.each { |x| if x<(ARGV[0].to_i) and (x == 0 || x == 1) then fib_final << x else fib_final << (fib_final[-1]+fib_final[-2]) end}
fib_final.pop
puts fib_final