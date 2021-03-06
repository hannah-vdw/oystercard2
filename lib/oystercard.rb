class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2.4

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(sum)
    fail "£#{MAXIMUM_BALANCE} limit" if (@balance + sum) > MAXIMUM_BALANCE
    @balance += sum
  end

  def touch_in(entry_station)
    fail "Insufficient funds. Please top up" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
    @journeys[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @journeys[:exit_station] = exit_station
  end
  
  def in_journey?
    @entry_station != nil
    # !!@entry station - does same as above
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end