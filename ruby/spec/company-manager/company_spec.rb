describe "Company" do

  before :all do
    @test_company = Company.new "Test Company"
    @manager = Manager.new "ClayManager"
    @h_employee = HourlyEmployee.new "ClayHourly"
  end

  describe "#initialize" do
    it "should instantiate without problems" do
      test = Company.new "Test Corp"
      expect(test).not_to be_nil
      expect(test.name).to eq("Test Corp")
    end
  end

  describe "#hire" do
    it "should be able to hire an employee" do
      employee = Employee.new "ClayEmployee"
      num_employees = @test_company.hire(employee)
      expect(num_employees).to eq(1)
    end

    it "should be able to hire an hourly employee" do
      num_employees = @test_company.hire(@h_employee)
      expect(num_employees).to eq(2)
    end

    it "should be able to hire a salaried employee" do
      s_employee = SalariedEmployee.new "ClaySalaried"
      num_employees = @test_company.hire(s_employee)
      expect(num_employees).to eq(3)
    end

    it "should be able to hire an executive" do
      executive = Executive.new "ClayExecutive"
      num_employees = @test_company.hire(executive)
      expect(num_employees).to eq(4)
    end

    it "should be able to hire a manager" do
      num_employees = @test_company.hire(@manager)
      expect(num_employees).to eq(5)
    end
  end

  describe "#fire" do
    it "should be able to fire an employee by name" do
      removed = @test_company.fire("ClayHourly")
      expect(removed.name).to eq("ClayHourly")
      expect(@test_company.employees.count).to eq(4)
    end

    it "should be able to fire an employee by id" do
      removed = @test_company.fire(3)
      expect(removed.name).to eq("ClaySalaried")
      expect(@test_company.employees.count).to eq(3)
    end

    it "should be able to fire an employee given an employee" do
      removed = @test_company.fire(@manager)
      expect(removed).to eq(@manager)
      expect(@test_company.employees.count).to eq(2)
    end
  end

  describe "#raise" do
    it "should be able to increase the pay of a named employee by a given percentage" do
      @test_company.hire(@h_employee)
      emp = @test_company.employees.find { |e| e.name == "ClayHourly" }
      @test_company.give_raise("ClayHourly", 0.10)
      expect(emp.payrate).to eq(7.98)
    end
  end
end