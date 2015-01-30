class SalariedEmployee < Employee
  attr_accessor :payrate

  DEFAULT_SALARY  = 50000

  def initialize(name, payrate = DEFAULT_SALARY)
    @payrate = payrate
    super name
  end

  def pay
    two_week_pay = (@payrate / 26.0)
    (two_week_pay * 100).round.to_f / 100
  end


end