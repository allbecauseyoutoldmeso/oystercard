class Journey

  attr_reader :entry_station, :exit_station
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def update_exit_station(station)
    self.exit_station = station
  end

  def output_data
    {entry_station => exit_station}
  end

  def fare
    illegal? ? PENALTY_FARE : MIN_FARE
  end

  def reset
    self.entry_station = nil
    self.exit_station = nil
  end

  private

  attr_writer :entry_station, :exit_station

  def illegal?
    entry_station == nil || exit_station == nil
  end

end
