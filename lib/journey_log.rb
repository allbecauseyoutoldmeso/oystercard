require_relative 'journey'

class JourneyLog

attr_reader :journey_class, :journey, :journeys

def initialize(journey_class)
  @journey_class = journey_class
  @journeys = []
end

def start(station)
  @journey = journey_class.new(station)
end

def finish(station)
  journey.update_exit_station(station)
  journeys << journey
end

private

def current_journey
  self.journey ||= journey_class.new
end

attr_writer :journeys

end
