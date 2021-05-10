class Oystercard

  attr_reader :balance, :in_journey
  MAXIMUM_VALUE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false

  end

  def top_up(value)
      fail "maximum limit reached #{MAXIMUM_VALUE}" if limit? 
      @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def limit?
    @balance >= MAXIMUM_VALUE ? true : false
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "less than minimum balance" if balance_below_minimum
    @in_journey = true
  end

  def touch_out 
    @in_journey = false
  end

  

  def balance_below_minimum
    # true
    @balance < MINIMUM_BALANCE ? true : false
  end
end

