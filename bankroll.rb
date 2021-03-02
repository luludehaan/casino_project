
class Bankroll
  attr_accessor :amount

  def initialize(amount)
    
    @amount = amount
    amount = gets.chomp.to_f
   
  end

  def add(amount)
    @amount += amount
  end

  def subtract(amount)
    @amount -= amount
  end
end

def bet_balance
    @bet = 0
    puts
    puts "Here is how much you have $#{@amount}.".yellow
    puts "How much do you want to bet?".yellow
    border
        @bet = gets.chomp.to_i
        if @bet > @amount
            puts "You don't have enough money, please select a lower bet.".red
            bet_balance
        elsif
            @bet <= 0
            puts "Please place a higher bet.".red
            bet_balance
        else
            puts "You have $#{@amount} total, and your bet is $#{@amount}.".yellow
    end
end