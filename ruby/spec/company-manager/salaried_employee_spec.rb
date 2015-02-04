describe "SalariedEmployee" do
  describe "#initialize" do
    it "should instantiate properly" do
      test = SalariedEmployee.new "Clay"
      expect(test.name).to eq("Clay")
    end

    it "should set the default payrate" do
      test = SalariedEmployee.new "Clay"
      expect(test.payrate).to eq(50000)
    end
  end

  describe "#pay" do
    it "should return the pay for a single paycheck" do
      test = SalariedEmployee.new "Clay"
      two_week_pay = test.pay
      expect(two_week_pay).to eq(1923.08)
    end
  end
end