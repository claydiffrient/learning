class HourlyEmployee < Employee
  attr_accessor :payrate

  MINIMUM_WAGE = 7.25

  def initialize(name, payrate = MINIMUM_WAGE)
    @payrate = payrate
    super name
  end

  def pay(hours)
    hours * @payrate
  end

  def give_raise(percentage)
    new_pay = @payrate + (@payrate * percentage)
    @payrate = (new_pay * 100).round.to_f / 100
  end
end