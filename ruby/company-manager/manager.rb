require_relative './salaried_employee'

class Manager < SalariedEmployee

  DEFAULT_SALARY  = 70000

  def initialize(name, salary = DEFAULT_SALARY)
    super name, salary
  end

end