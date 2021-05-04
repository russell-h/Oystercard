
require './lib/oystercard'
describe Oystercard do 

  it 'tests a new Oystercard balance is 0' do 
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

end