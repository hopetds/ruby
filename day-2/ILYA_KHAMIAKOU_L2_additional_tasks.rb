#ADDITIONAL TASKS
#ILYA_KHAMIAKOU

#### 1 #####
#!/usr/bin/env ruby
dni = "dniMyMdegnahCybuR"
puts (dni = (dni.reverse.downcase).capitalize)

#### 2 #####
#!/usr/bin/env ruby
dec = 123456789
puts dec.to_s.reverse.to_i

#### 3 #####
#!/usr/bin/env ruby
number = ARGV #enter number
sum = 0
number.to_s.each_char { |c| sum = sum + c.to_i }
p sum

#### 4 #####
#!/usr/bin/env ruby
stringA = ARGV #enter your string
cnt = 0
stringA.to_s.each_char { |c| if c == "a" || c == "A" then cnt +=1 end}
p cnt

#### 5 #####
#!/usr/bin/env ruby
pal = "Νίψον ανομήματα μη μόναν όψιν"
#creating new string without any spec symbols, whitespaces, and making it all downcase
pal_new = pal.gsub(/[^0-9a-zA-Z]/, '').downcase
puts "#{pal} is a pal ?"
if pal_new == pal_new.reverse then p "yes" else p "no" end

#### 5 #####
#!/usr/bin/env ruby
myarr= (3..10).to_a.reverse
myarr -= [5]
myarr.each { |c| if c%3 == 0 then p c ** 2 else p c end}

#### 6 #####
#!/usr/bin/env ruby
shop = {milk: 10, bread: 8, cornflakes: 12, ice_cream: 15, pie: 20}
n1 = 255
needed = shop.index(n1)
p "Is there any product in shop that costs #{n1}?"
if needed != nil then p "Yes, it is #{needed}" else p "No" end

#### 7 #####
#!/usr/bin/env ruby
ar = [1, 6,1,8,2,-1,3,5]
ar_max = ar.max
ar = ar.map { |x| x == ar_max ? x+100: x}
p ar

#### 8 #####
#!/usr/bin/env ruby
ar = [7, 3, [4, 5, 1], 1, 9, [2, 8, 1]]
bar = []
ar.join.each_char { |x| bar << x}
puts bar.sort.reverse