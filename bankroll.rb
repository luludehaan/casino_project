
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
