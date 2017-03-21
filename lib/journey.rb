class Journey

  attr_reader :entry_station, :exit_station

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

  def reset
    entry_station = nil
    exit_station = nil
  end

  private

  attr_writer :entry_station, :exit_station

end
