#!/usr/bin/env ruby
def error_method(arg1,arg2,*args)
	if block_given? then notness = args.each {yield} else puts "ERROR" end
	notness.each { |i| puts i}
end
error_method(255,2331,1,2,3){|i| puts i}
