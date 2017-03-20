require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'shows the money on the card' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up money on the card' do
      initial_balance = subject.balance
      top_up_value = 50
      expect(subject.top_up(top_up_value)).to eq (initial_balance + top_up_value)
    end
  end

end
