require 'station'

describe Station do

subject(:station) { described_class.new }

it 'has a name' do
   expect(station.name).to be_a(String)
end

it 'has a zone' do
  expect(station.zone).to be_a(Fixnum)
end

end
