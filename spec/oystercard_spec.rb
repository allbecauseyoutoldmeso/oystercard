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
      amount = 50
      expect{subject.top_up(amount)}.to change{subject.balance}.by amount
    end
  end

end
