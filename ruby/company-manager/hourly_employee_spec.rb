require_relative './hourly_employee'

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
end