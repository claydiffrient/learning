require_relative './employee'

class Company
  attr_accessor :name, :employees

  def initialize(name, employees = [])
    @name = name
    @employees = employees
  end

  def hire(employee)
    @employees.push(employee)
    @employees.count
  end

  def fire(employee)
    if employee.is_a? String
      employee_to_fire = @employees.find { |e| e.name == employee }
    elsif employee.is_a? Numeric
      employee_to_fire = @employees.find { |e| e.id == employee }
    elsif employee.is_a? Employee
      employee_to_fire = @employees.find { |e| e == employee }
    end

    @employees.delete(employee_to_fire)
    employee_to_fire
  end

  def give_raise(employee, percentage)
    if employee.is_a? String
      employee_to_raise = @employees.find { |e| e.name == employee }
    end

    employee_to_raise.give_raise(percentage)

end