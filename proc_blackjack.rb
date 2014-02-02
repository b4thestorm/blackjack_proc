def total(cards)
#I want to give each card a reference value and total it up.
	arr= cards.map do |e| 
				puts e[1]
				end 

	total= 0
	arr.each do |x|
		case x 
		when x == 'A'
			total += 11
		when x.to_i == 0
			total += 10
		when x.to_i > 0 
			total += x.to_i 
		end
	end
#copied the correction code, because of its genius. !!)
	arr.select{|e| e=='A'}.count.times do 
		total -= 10 if total == 21
	end
total
end

suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K']
deck = []
deck << suits.product(cards)
deck.shuffle!

player = []
dealer = []

#initial deal cards
2.times do
player << deck.pop
dealer << deck.pop
end

player_total = total(player)
dealer_total = total(dealer)

#show hand
#I want to show each card for the player and the dealer along with the total.
def show(arr)
	if arr[0] == 'H'
		#I want to replace the string in the array with Hearts 
		arr[0]= 'Hearts'
	elsif arr[0] == 'D'
		arr[0]= 'Diamonds'
	elsif arr[0] == 'S'
		arr[0]= 'Spades'
	else arr[0] == 'C'
		arr[0]= 'Clubs'
	end
end

puts "Player has a #{player[1]} of #{show(player)} for a total of: #{player_total}"
puts "Dealer has a #{dealer[1]} of #{show(dealer)} for a total of: #{dealer_total}"

puts "Welcome to Blackjack"
puts ""
puts ""
puts "What is your name?"
p_name = gets.chomp
puts "Cards are being dealt"
puts "Player has a #{player[1]} of #{show(player)} for a total of: #{player_total}"
puts "Do you choose to Hit or Stay"


while player_total< 21  #Player Turn 
		puts "What would you like to do?"
		puts "Type 1)to Hit  :: 2) to Stay"
		hit_stay = gets.chomp

		if !['1','2'].include(hit_stay)
			puts "Error: you must choose 1 or 2"
			next
		end

		if hit_stay== '1'
		  new_card= deck.pop
    	puts "Dealing card to player: #{new_card}"
    	player << new_card
    	mytotal = total(player)
    	puts "Your total is now #{mytotal}"
    	end

		if hit_stay== '2'
			puts "You chose to stay"
			break
		end

		if mytotal == 21
			"Congratulations, you hit Blackjack"
			exit
		else mytotal > 21
			"Player, has busted"
			exit
		end
end

if dealer_total == 21
	"Sorry, the Dealer has won"
end

while dealer_total < 17 #dealer turn 

	  new_card= deck.pop
    	puts "Dealing card to Dealer: #{new_card}"
    	dealer << new_card
    	dealertotal = total(dealer)
    	puts "Dealer total is now #{dealertotal}"

	if dealertotal == 21
		"Sorry, the Dealer has won"
		exit
	else dealertotal > 21
		"Congratulations, the Dealer has busted"
		exit
	end
end

puts ""
puts ""

if dealertotal > mytotal
	puts "Sorry, the dealer wins."
elsif dealertotal < mytotal
	puts "Congratulations, Player wins!"
else
	puts "It's a tie!"
end
exit 