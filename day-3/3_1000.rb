#!/usr/bin/env ruby
arr = (0..1000).to_a
arr.each { |x| if x.to_s.length == 3 and x%7 == 3 then p x and break end}