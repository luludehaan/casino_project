def border
    puts
    puts "-" * 40
    puts
end

def high_low_menu
    high_low = puts <<-'EOF'
        
        /$$   /$$ /$$           /$$              /$$        /$$$$$$  /$$      /$$
        | $$  | $$|__/          | $$             | $$       /$$__  $$| $$  /$ | $$
        | $$  | $$ /$$  /$$$$$$ | $$$$$$$        | $$      | $$  \ $$| $$ /$$$| $$
        | $$$$$$$$| $$ /$$__  $$| $$__  $$       | $$      | $$  | $$| $$/$$ $$ $$
        | $$__  $$| $$| $$  \ $$| $$  \ $$       | $$      | $$  | $$| $$$$_  $$$$
        | $$  | $$| $$| $$  | $$| $$  | $$       | $$      | $$  | $$| $$$/ \  $$$
        | $$  | $$| $$|  $$$$$$$| $$  | $$       | $$$$$$$$|  $$$$$$/| $$/   \  $$
        |__/  |__/|__/ \____  $$|__/  |__//$$$$$$|________/ \______/ |__/     \__/
                        /$$  \ $$         |______/                                 
                        $$$$$$/  |                                                
                        \______/                                                   
    EOF
    
    puts
    puts



    puts "*********************   WELCOME TO HIGH LOW   *********************".yellow 
    puts
    puts "A banker number and player number will be drawn.".cyan 
    puts "If the player's number is higher, you win!".cyan
    puts
    puts "Please select from below.".cyan
    border
    puts "1 - Play High Low".yellow
    puts "2 - Return to Casino".yellow
    border
    user_input = gets.chomp.to_i
    case user_input
    when 1
        bet_balance
        high_low_game
    when 2
        puts "Thanks for playing!".yellow
        menu
        exit
    else
        puts "Invalid, try again.".red
        high_low_menu
    end 
end

def high_low_lose
    puts "Shucks, you lose!".red
    @amount -= @bet
    puts
    puts "Your updated bankroll is $#{@amount}.".yellow
    if @amount < @bet
        puts "You ran out of money! Goodbye!".red
        menu
    else
        border
        play_again_highlow
    end
end

def high_low_win
    puts "You Win! Winner Winner Chicken Dinner!".green 
    @amount += @bet
    puts
    puts "Your updated bankroll is $#{@amount}.".yellow
    if @amount < @bet
        puts "You ran out of money! Goodbye!".red
        menu
    else
        border
        play_again_highlow
    end
end

def high_low_game
    @banker_num = rand(1..10)
    @player_num = rand(1..10)
    border
    puts "RESULTS"
    puts
    puts "The banker's number is #{@banker_num}".yellow
    puts "The player's number is #{@player_num}".cyan
    puts
    if @banker_num < @player_num
        high_low_win
    elsif @banker_num > @player_num
        high_low_lose
    else @banker_num == @player_num
        puts "It's a tie! Try again.".yellow
        high_low_game
    end
end

def play_again_highlow
    puts "Do you want to play again? (1. Yes, 2. No)".cyan
    choice = gets.chomp.to_i
    case choice
    when 1
        high_low_game
    when 2
        "Thanks for playing!".yellow
        high_low_menu
    end
end



# high_low_menu