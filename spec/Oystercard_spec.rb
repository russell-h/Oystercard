
require './lib/oystercard'

describe Oystercard do 

  it 'tests a new Oystercard balance is 0' do 
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  describe '#top_up' do 
  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by 10

  end
  end

end