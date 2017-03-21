require_relative 'station'
require_relative 'journey_log'

class Oystercard

attr_reader :balance, :entry_station, :history, :exit_station, :journey

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new(nil)
  end

  def top_up(amount)
    raise "Maximum limit exceeded: £#{MAX_LIMIT}" if max?(amount)
    self.balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance" if balance < Journey::MIN_FARE
    self.journey = Journey.new(station)
  end

  def touch_out(station)
    journey.update_exit_station(station)
    history << journey.output_data
    journey.reset
    deduct(Journey::MIN_FARE)
  end

  def in_journey?
    journey.entry_station != nil && journey.exit_station == nil
  end

  private

  MAX_LIMIT = 90

  attr_writer :balance, :entry_station, :exit_station, :journey

  def max?(amount)
   (self.balance + amount) > MAX_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end


end
