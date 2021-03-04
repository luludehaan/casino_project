def slot_game
  pid = fork{ exec 'afplay', "slotsound.mp3" }
  @first_slot = rand(1..5)
  @second_slot = rand(1..5)
  @third_slot = rand(1..5)
  border
  puts "RESULTS".bold
  puts
  puts "#{@first_slot}" "-" "#{@second_slot}" "-" "#{@third_slot}".colorize(:background => :blue)
  puts
  if @first_slot==@second_slot && @second_slot==@third_slot
    puts "You Win! Winner Winner Chicken Dinner!".green 
    puts
    @amount += @bet * 3
    puts "You Won $#{@bet * 3}"
    puts "Your updated bankroll is $#{@amount}"
    puts
    play_again  
  elsif @first_slot==@second_slot || @second_slot==@third_slot || @first_slot==@third_slot
    puts "Winner Times 2".green
    puts "You Win! Winner Winner Chicken Dinner!".green 
    puts
    @amount += @bet * 2
    puts "You Won $#{@bet * 2 }"
    puts "Your updated bankroll is $#{@amount}"
    puts
    play_again
  else
    puts "Shucks, you lose!".red
    @amount -= @bet
    puts
    puts "Your updated bankroll is $#{@amount}"
    puts "loser" 
    puts
    play_again  
  end
end
  
def slots_menu
  banner = "

      :::::::::  :::    ::: :::::::::  :::   :::       ::::::::  :::        :::::::: ::::::::::: ::::::::  
      :+:    :+: :+:    :+: :+:    :+: :+:   :+:      :+:    :+: :+:       :+:    :+:    :+:    :+:    :+: 
      +:+    +:+ +:+    +:+ +:+    +:+  +:+ +:+       +:+        +:+       +:+    +:+    +:+    +:+        
      +#++:++#:  +#+    +:+ +#++:++#+    +#++:        +#++:++#++ +#+       +#+    +:+    +#+    +#++:++#++ 
      +#+    +#+ +#+    +#+ +#+    +#+    +#+                +#+ +#+       +#+    +#+    +#+           +#+ 
      #+#    #+# #+#    #+# #+#    #+#    #+#         #+#    #+# #+#       #+#    #+#    #+#    #+#    #+# 
      ###    ###  ########  #########     ###          ########  ########## ########     ###     ########  

      "
  puts "#{banner}"

  puts
  puts "                         ************   WELCOME TO SLOTS  ************".yellow.bold 
  puts
  puts "If you match 2 numbers payout is times 2".cyan 
  puts "If you match 3 numbers payout is times 3".cyan
  puts
  puts "Please select from below.".cyan
  border
  puts "1 - Place Your Bet".yellow
  puts "2 - Return to Casino".yellow
  border
  user_input = gets.chomp.to_i
  case user_input
  when 1
    slots_bet
  when 2
    puts "Thanks for playing!".yellow
    menu
    exit
  else
    puts "Invalid, try again.".red
    slots_menu
  end 
end
  
def slots_bet
  @bet = 0
  puts
  puts "Here is how much you have $#{@amount}.".yellow
  puts "How much do you want to bet?"
    @bet = gets.chomp.to_i
    if @bet > @amount
      puts "You don't have enough money, please select a lower bet.".red
      slots_menu
    else
      puts "You have $#{@amount} total, and your bet is $#{@bet}".yellow
      slot_game
    end
  end
  
def play_again
  puts "Do you want to play again? (1. Yes, 2. No)"
  choice = gets.chomp.to_i
  case choice
  when 1
    slots_bet
  when 2
    "Thanks for playing!"
    slots_menu
  end
end