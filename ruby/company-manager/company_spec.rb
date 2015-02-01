require_relative './company'
require_relative './employee'
require_relative './hourly_employee'
require_relative './salaried_employee'
require_relative './manager'
require_relative './executive'

describe "Company" do

  before :all do
    @test_company = Company.new "Test Company"
  end

  describe "#initialize" do
    it "should instantiate without problems" do
      test = Company.new "Test Corp"
      expect(test).not_to be_nil
      expect(test.name).to eq("Test Corp")
  end

  describe "#hire" do
    it "should be able to hire an employee" do
      employee = Employee.new "Clay"
      num_employees = @test_company.hire(employee)
      expect(num_employees).to eq(1)
    end

    it "should be able to hire an hourly employee" do
      h_employee = HourlyEmployee.new "Clay"
      num_employees = @test_company.hire(h_employee)
      expect(num_employees).to eq(2)
    end

    it "should be able to hire a salaried employee" do
      s_employee = SalariedEmployee.new "Clay"
      num_employees = @test_company.hire(s_employee)
      expect(num_employees).to eq(3)
    end

    it "should be able to hire an executive" do
      executive = Executive.new "Clay"
      num_employees = @test_company.hire(executive)
      expect(num_employees).to eq(4)
    end

    it "should be able to hire a manager" do
      manager = Manager.new "Clay"
      num_employees = @test_company.hire(manager)
      expect(num_employees).to eq(5)
    end
  end


end