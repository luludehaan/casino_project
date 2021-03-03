def coin_menu
    puts "*********************   WELCOME TO COIN TOSS   *********************".yellow 
    puts
    puts "If you guess which face the coin lands on, you win!.".cyan 
    puts
    puts "Please select from below.".cyan
    border
    puts "1 - Play Coin Toss".yellow
    puts "2 - Return to Casino".yellow
    border
    user_input = gets.chomp.to_i
    case user_input
    when 1
        bet_balance
        coin_toss
    when 2
        puts "Thanks for playing!".yellow
        menu
        exit
    else
        puts "Invalid, try again.".red
        coin_menu
    end 
end

def coin_toss
    puts "MAKE YOUR CHOICE...heads or tails?".cyan
    border
    @users_choice = gets.chomp.to_s
    if (rand(1..2)) == 1
        @coin = "heads"
    else (rand(1..2)) == 2
        @coin = "tails"
    end
    border
    puts "The coin is...".blink
    sleep(3)
    puts
    puts "#{@coin.upcase.bold}!!!!"
    puts
    sleep(1)
    coin_results
end

def coin_results
    if @users_choice == @coin
        coin_win
    else 
        coin_lose
    end
end

def play_again_coin
    puts "Do you want to play again? (1. Yes, 2. No)".cyan
    choice = gets.chomp.to_i
    case choice
    when 1
        coin_toss
    when 2
        "Thanks for playing!".yellow
        coin_menu
    end
end

def coin_lose
    puts "Shucks, you lose!".red
    @amount -= @bet
    puts
    puts "Your updated bankroll is $#{@amount}.".yellow
    if @amount < @bet
        puts "You ran out of money! Goodbye!".red
        menu
    else
        border
        play_again_coin
    end
end

def coin_win
    puts "You Win! Winner Winner Chicken Dinner!".green 
    @amount += @bet
    puts
    puts "Your updated bankroll is $#{@amount}.".yellow
    if @amount < @bet
        puts "You ran out of money! Goodbye!".red
        menu
    else
        border
        play_again_coin
    end
end