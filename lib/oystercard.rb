require_relative 'station'
require_relative 'journey_log'

class Oystercard

attr_reader :balance, :entry_station, :history, :exit_station, :journey, :journey_log

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(Journey)
  end

  def top_up(amount)
    raise "Maximum limit exceeded: £#{MAX_LIMIT}" if max?(amount)
    self.balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance" if balance < Journey::MIN_FARE
    journey_log.start(station)
  end

  def touch_out(station)
    journey_log.finish(station)
    deduct(Journey::MIN_FARE)
  end

  def in_journey?
    return false if journey_log.journey == nil
    journey_log.journey.entry_station != nil && journey_log.journey.exit_station == nil
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
