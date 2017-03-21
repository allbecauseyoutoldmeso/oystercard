class Oystercard

attr_reader :balance, :entry_station, :history, :exit_station

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @history = []
  end

  def top_up(amount)
    raise "Maximum limit exceeded: £#{MAX_LIMIT}" if max?(amount)
    self.balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance" if balance < MIN_LIMIT
    self.entry_station = station
  end

  def touch_out(station)
    self.exit_station = station
    history << {entry_station => exit_station}
    self.entry_station = nil
    deduct(MIN_LIMIT)
  end

  def in_journey?
    entry_station != nil
  end

  private

  MAX_LIMIT = 90
  MIN_LIMIT = 1

  attr_writer :balance, :entry_station, :exit_station

  def max?(amount)
   (self.balance + amount) > MAX_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end


end
