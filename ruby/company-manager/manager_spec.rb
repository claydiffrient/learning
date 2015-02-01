require_relative './manager'

describe "Manager" do
  describe "#initialize" do
    it "should instantiate properly" do
      test = Manager.new "Clay"
      expect(test.name).to eq("Clay")
    end

    it "should set the default salary" do
      test = Manager.new "Clay"
      expect(test.payrate).to eq(70000)
    end
  end

  describe "#pay" do
    it "should return the pay for a single paycheck" do
      test = Manager.new "Clay"
      two_week_pay = test.pay
      expect(two_week_pay).to eq(2692.31)
    end
  end
end