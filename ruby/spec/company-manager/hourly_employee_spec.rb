describe "HourlyEmployee" do
  describe "#initialize" do
    it "should instantiate properly" do
      test = HourlyEmployee.new "Clay"
      expect(test.name).to eq("Clay")
    end

    it "should set minimum wage as the default payrate" do
      test = HourlyEmployee.new "Clay"
      expect(test.payrate).to eq(7.25)
    end
  end

  describe "#pay" do
    it "should calculate the proper pay given the hours worked" do
      test = HourlyEmployee.new "Clay"
      total_pay = test.pay 40
      expect(total_pay).to eq(290)
    end
  end
end