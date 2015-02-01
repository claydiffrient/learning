class Executive < Employee
  attr_accessor :percentage

  DEFAULT_PERCENTAGE  = 0.10

  def initialize(name, percentage = DEFAULT_PERCENTAGE)
    @percentage = percentage
    super name
  end

  def pay(profits)
    total_pay = profits * @percentage
  end

end