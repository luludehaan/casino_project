require_relative './bankroll.rb'
require_relative './menu.rb'
require "BigDecimal"
require 'colorize'

class User
  
  attr_accessor :name, :age, :bankroll

  def initialize
    puts "BEFORE WE GET STARTED, A FEW QUESTIONS..."
    puts
    puts "What is your name?"
    @name = gets.strip.to_str
    puts "What is your age?"
    #@age = gets.to_i
    verify_age
    puts "What does your bankroll look like, #{name}?"
    @amount = (gets.chomp.to_f.truncate(2))
    puts "Your current balance is $ #{@amount}."
   
    initial_amount
  end

  def verify_age
    @age = gets.chomp.to_i
    if @age < 21 && @age >= 1
      print ` say Sorry you are not old enough to play`
      print ` say You need to leave the casino!`
      !exit
    elsif @age >= 21 
      print `say welcome`
    else @age == 0
      print `say please try again!`
      sleep(2)
      initialize
    end
  end


  def initial_amount
    amount = @amount
    
    if @amount >= 5000
      print ` say High roller`
      menu
    elsif @amount >= 1 && @amount <= 5000
      puts "Good Luck!!".green
      sleep(1)
      menu
    
    else
      puts "Come back when you have some $$$".red
      sleep(1)
      !exit
    end
    
  end

end
User.new