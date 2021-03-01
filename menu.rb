# Basic Objectives:

# Start game player has a name and an initial bankroll
# Player can go to different games via menu
# Slots
# High / Low
# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses
require_relative 'highlow'
require 'colorize'

def menu
  puts "************   WELCOME TO THE CASINO   ************".yellow
  puts
  puts "Please make a selection.".cyan
  puts
  puts "1) Play Slots?".yellow
  puts "2) Play High Low?".yellow
  puts "3) See Balance.".yellow
  puts "4) Exit?".yellow
  choice = gets.chomp.to_i
  case choice
  when 1
    play_slots
  when 2
    high_low_menu
  when 3 
    #bankroll
    puts "You have $#{@amount.to_f.round(3)} to bet with.".yellow
    sleep 1
    menu
  when 4
    puts "Please Come Again!".green
    !exit
  else
    puts "Not a valid entry.".red
  end
end
