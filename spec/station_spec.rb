require 'station'

describe Station do

subject(:station) { described_class.new('Leyton', 3) }


it 'has a name' do
   expect(station.name).to eq 'Leyton'
end

it 'has a zone' do
  expect(station.zone).to eq 3
end

end
