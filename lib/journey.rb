require_relative 'station'

class Journey

  attr_reader :entry_station, :exit_station
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = :home)
    @entry_station = entry_station
    @exit_station = nil
  end

  def update_exit_station(station)
    self.exit_station = station
  end

  def fare
    illegal? ? PENALTY_FARE : (MIN_FARE + legal_fare)
  end

  private

  attr_writer :entry_station, :exit_station

  def illegal?
    entry_station == nil || exit_station == nil
  end

  def legal_fare
    (entry_station.zone - exit_station.zone).abs
  end

end
