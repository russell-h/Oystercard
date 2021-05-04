class Oystercard

  attr_reader :balance

  MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
      fail "maximum limit reached #{MAXIMUM_VALUE}" if limit? 
      @balance = @balance + value
    
  end

  def limit?
    @balance >= MAXIMUM_VALUE ? true : false

  end


end