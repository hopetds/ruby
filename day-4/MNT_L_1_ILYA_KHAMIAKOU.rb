#!/usr/bin/env ruby
##################################Ilya_khamiakou########################################
=begin
I've used to have ruby on my centos before this task, cause it was required to have ruby-json to run "Ansible discovery program FACTER"
So, at first ive removed Ruby simply by typing:
	$yum remove ruby
	
Then I've followed setup steps described in the Lecture_1.pdf:
	$gpg keyserver hkp://keys.gnupg.net recvkeys
	$\curl sSL https://get.rvm.io | bash s
	$source ~/.rvm/scripts/rvm
	$rvm requirements
	$rvm -v  
		#returned output:
		#rvm 1.29.1 (latest) by Michal Papis, Piotr Kuczynski, Wayne E. Seguin [https://rvm.io/]
	$rvm install 2.4.1
	$rvm use 2.4.1 --default
	$ruby -v 
		#returned output:
		#ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
	$rvm list
		#returned output:
		#[student@epbyminw1969 ruby]$ rvm list
		#rvm rubies
		#=* ruby-2.4.1 [ x86_64 ]
	$rvm gemset create test - creates gemset
	$rmv gemset delete test - deletes gemset
	$rmv gemset create lab
	$rvm gemset list 
		#returned output:
		#gemsets for ruby-2.4.1 (found in /home/student/.rvm/gems/ruby-2.4.1)
		#=> (default)
		#global
		#lab
	$rvm use 2.4.1@lab --default
	$rvm gemset install pry
	$rvm gemset install sqlite3
=end
#############################################################################################

######Practice########

##########SCRIPT 1 START#############

#ive simply pasted it here.

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

#########SCRIPT 1 END###############

#########SCRIPT 2 START###############

#ive simply pasted it here

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

#########SCRIPT 2 END###############

#Maybe its ugly but ive done it without too much googleing. Ill improve my code during the next tasks.

