class Oystercard

attr_reader :balance



  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'Maximum limit exceeded' if max?(amount)
    @balance += amount
  end

  private
  
  MAX_LIMIT = 90

  def max?(amount)
   (@balance + amount) > MAX_LIMIT
  end

end
