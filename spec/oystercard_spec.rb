require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'shows the money on the card' do
      expect(subject.balance).to eq 0  
    end
  end

end
