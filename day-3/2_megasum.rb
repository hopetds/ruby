#!/usr/bin/env ruby
## Сложение нескольких чисел
##  (5..10).inject {|sum, n| sum + n }              #=> 45\
##A missing block. You can check if a block is given
arr = (1..(ARGV[0].to_i)).to_a
def mega_sum(arg,numeric = 0)
	sum = 0
	if block_given?
		arg.inject { |sum, i| sum + yield(i)} + numeric
	else
		arg.inject { |sum, i| sum + i } + numeric
	end	
end
puts "Condiriton: (array). . Simple sum of the elements:  #{mega_sum(arr)}"
puts "Condiriton: ((array),10). No block, Numeric is given. Result:  #{mega_sum(arr, 10)}"
puts "Condiriton: (array){|i| i ** 2}. No numeric. Block is given. Result:  #{mega_sum(arr){|i| i ** 2}}"
puts "Condiriton: ((array)10){|i| i ** 2}. Block and numeric is given. Result:  #{mega_sum(arr, 10){|i| i ** 2}}"

