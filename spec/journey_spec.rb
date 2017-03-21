require 'journey'

describe Journey do

  subject(:journey) {described_class.new(station)}
  let(:station) { double :station }
  let(:station2) { double :station2 }

  before do
    journey.update_exit_station(station2)
  end

  it 'records an exit station' do
    expect(journey.exit_station).to eq station2
  end

  it 'reports a journey' do
    expect(journey.output_data).to eq ({station => station2})
  end

  it 'resets' do
    journey.reset
    expect(journey.output_data).to eq ({nil => nil})
  end

  describe '#fare' do

    it 'gives a minimum fare if journey completed' do
      expect(journey.fare).to eq Journey::MIN_FARE
    end

    it 'returns penalty fare if journey incomplete' do
      journey.reset
      expect(journey.fare).to eq 6
    end

  end

end
