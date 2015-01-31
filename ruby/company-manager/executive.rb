class Executive < Employee
  attr_accessor :payrate

  DEFAULT_PERCENTAGE  = .10

  def initialize(name, percentage = DEFAULT_PERCENTAGE)
    @percentage = percentage
    super name
  end

  def pay(profits)
    total_pay = profits * @percentage
  end


end