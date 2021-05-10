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
    it 'raises an error if maximum value greater than £90' do
      maximum_balance = Oystercard::MAXIMUM_VALUE
      subject.top_up(90)
      expect{subject.top_up(1)}.to raise_error "maximum limit reached #{maximum_balance}"
    end
  end

  describe 'deduct' do
    it 'reduces the balance on the oystercard when the card is used' do
      subject.top_up(10)
      expect{ subject.deduct(10) }.to change{ subject.balance }.by -10
    end
  end
      
  describe 'in journey?' do
    it 'check in journey is false at start' do
      expect(subject).not_to be_in_journey
    end
  end

  describe 'touch in' do
    it 'raises error when card has less than minimum balance' do

      expect{subject.touch_in}.to raise_error "less than minimum balance"
    end

    it 'when touch in in_jouney? returns true' do
      subject.top_up(20)
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe 'touch out' do
    it "can touch out" do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  
  
  
end