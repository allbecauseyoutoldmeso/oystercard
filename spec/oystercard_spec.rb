require 'oystercard'

describe Oystercard do

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
    it 'raises error if top_up will bring balance to more than 90' do
      expect { subject.top_up(100) }.to raise_error 'Maximum limit exceeded'
    end
  end

end
