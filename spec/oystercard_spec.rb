require 'oystercard'

describe Oystercard do

  max_limit = Oystercard::MAX_LIMIT
  min_limit = Journey::MIN_FARE

  let(:station) {double(:station)}
  let(:station2) {double(:station2)}
  let(:journey) {double(:journey)}

  it 'is initialised as not in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'has an empty history by default' do
    expect(subject.history).to eq []
  end

  describe '#balance' do
    it 'shows the money on the card' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up money on the card' do
      amount = 50
      expect{subject.top_up(amount)}.to change{subject.balance}.by amount
    end
    it "raises error if top_up will bring balance to more than £#{max_limit}" do
      expect { subject.top_up(max_limit + 1) }.to raise_error "Maximum limit exceeded: £#{max_limit}"
    end
  end



  describe '#touch_in' do
    it 'updates the journey status' do
      subject.top_up(min_limit)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end
    it 'raises an error if less than minimum balance' do
      expect{subject.touch_in(station)}.to raise_error "Insufficient balance"
    end

    it 'creates a journey with the specified entry station' do
      subject.top_up(min_limit)
      expect(subject.touch_in(station).entry_station).to eq station
    end

  end

  describe '#touch_out' do
    before do
      subject.top_up(min_limit)
      subject.touch_in(station)
    end
    context 'for inspecting behaviour and recording journey data' do
      before do
        subject.touch_out(station2)
      end
      it 'updates the journey status to not in journey' do
        expect(subject).not_to be_in_journey
      end

#      it 'resets the entry station to nil' do
#        expect(subject.entry_station).to be_nil
#      end
#      it 'records the exit station' do
#        expect(subject.exit_station).to eq station2
#      end
      it 'records the journey and saves it to card history' do
        expect(subject.history).to include({station => station2})
      end
    end

    it 'deducts the minimum fare of #{min_limit}' do
      expect {subject.touch_out(station2)}.to change{subject.balance}.by(-min_limit)
    end

  end

end
