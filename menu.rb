require_relative 'highlow'
require_relative 'slots_menu'

def menu

  puts "welcome to the casino. What would you like to do?"
  puts "1) Play Slots?"
  puts "2) Play High Low?"
  puts "3) how much have you lost?"
  puts "4) Exit?"
  choice = gets.chomp.to_i
  case choice
  when 1
    slots_menu
    menu
  when 2
    high_low_menu
    menu
  when 3 
    #bankroll
    puts "You have $#{@amount.to_f.round(3)} to bet with."
    sleep 1
    menu
  when 4
    puts "please come again!"
    !exit
  else
    puts "Not a valid entry"
  end
end