require 'journey_log'

describe JourneyLog do


let(:journey) { double :journey, update_exit_station: station }
let(:station) { double :station }
let(:journey_class) { double :journey_class, new: journey}
subject(:journey_log) {described_class.new(journey_class)}



  describe "#start" do
    it 'creates a new journey' do
      expect(journey_class).to receive(:new).with(station)
      journey_log.start(station)
    end
  end

  describe '#finish' do
    it 'adds an exit station to current journey' do
      journey_log.start(station)
      expect(journey).to receive(:update_exit_station).with(station)
      journey_log.finish(station)
    end
  end

  describe '#journeys' do
    it 'returns a list of journeys' do
      journey_log.start(station)
      journey_log.finish(station)
      expect(journey_log.journeys).to eq [journey]
    end
  end

end
