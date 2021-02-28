def border
    puts
    puts "-" * 40
    puts
end

def high_low_menu
    puts
    puts "************   WELCOME TO HIGH LOW   ************" 
    puts
    puts "A banker number and player number will be drawn." 
    puts "If the player's number is higher, you win!"
    puts
    puts "Please select from below."
    border
    puts "1 - Play High Low"
    puts "2 - Return to Casino"
    border
    user_input = gets.chomp.to_i
    case user_input
    when 1
        high_low_bet
    when 2
        puts "Thanks for playing!"
        menu
        exit
    else
        puts "Invalid, try again."
        high_low_menu
    end 
end

def high_low_bet
    @bet = 0
    puts
    puts "Here is how much you have $#{@amount}."
    puts "How much do you want to bet?"
    border
        @bet = gets.chomp.to_i
        if @bet > @amount
            puts "You don't have enough money, please select a lower bet."
            high_low_bet
        elsif
            @bet <= 0
            puts "Please place a higher bet."
            high_low_bet
        else
            puts "You have $#{@amount} total, and your bet is $#{@amount}"
            high_low_game
    end
end

def high_low_lose
    puts "Shucks, you lose!"
    @amount -= @bet
    puts
    puts "Your updated bankroll is $#{@amount}"
    if @amount < @bet
        puts "You ran out of money! Goodbye!"
        menu
    else
        border
        play_again
    end
end

def high_low_win
    puts "You Win! Winner Winner Chicken Dinner!" 
    @amount += @bet
    puts
    puts "Your updated bankroll is $#{@amount}"
    if @amount < @bet
        puts "You ran out of money! Goodbye!"
        menu
    else
        border
        play_again
    end
end

def high_low_game
    @banker_num = rand(1..10)
    @player_num = rand(1..10)
    border
    puts "RESULTS"
    puts
    puts "The banker's number is #{@banker_num}"
    puts "The player's number is #{@player_num}"
    puts
    if @banker_num < @player_num
        high_low_win
    elsif @banker_num > @player_num
        high_low_lose
    else @banker_num == @player_num
        puts "It's a tie! Try again."
        high_low_game
    end
end

def play_again
    puts "Do you want to play again? (1. Yes, 2. No)"
    choice = gets.chomp.to_i
    case choice
    when 1
        high_low_game
    when 2
        "Thanks for playing!"
        high_low_menu
    end
end


# high_low_menu