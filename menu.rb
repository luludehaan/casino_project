require_relative 'highlow'
require_relative 'slots_menu'


def menu
  casino = puts <<-'EOF'
    .------..------..------..------..------..------.
    |C.--. ||A.--. ||S.--. ||I.--. ||N.--. ||O.--. |
    | :/\: || (\/) || :/\: || (\/) || :(): || :/\: |
    | :\/: || :\/: || :\/: || :\/: || ()() || :\/: |
    | '--'C|| '--'A|| '--'S|| '--'I|| '--'N|| '--'O|
    `------'`------'`------'`------'`------'`------'

  EOF
  
  puts "Welcome to the Casino. What would you like to do?".bold
  puts "1) Play Slots?"
  puts "2) Play High Low?"
  puts "3) Play Coin Toss?"
  puts "4) How Much Have You Lost?"
  puts "5) Exit?"
  choice = gets.chomp.to_i
  case choice
  when 1
    slots_menu
    menu
  when 2
    high_low_menu
    menu
  when 3
    coin_menu
  when 4 
    #bankroll
    puts "You have $#{@amount.to_f.round(3)} to bet with.".yellow
    sleep 1
    menu
  when 5
    puts "Please Come Again!".green
    !exit
  else
    puts "Not a valid entry.".red
  end
end