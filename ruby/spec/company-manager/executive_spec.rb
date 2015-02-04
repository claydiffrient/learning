describe "Executive" do
  describe "#initialize" do
    it "should instantiate properly" do
      test = Executive.new "Clay"
      expect(test.name).to eq("Clay")
    end

    it "should set the profit sharing percentage" do
      test = Executive.new "Clay"
      expect(test.percentage).to eq(0.10)
    end
  end

  describe "#pay" do
    it "should calculate the proper pay given the profits earned" do
      test = Executive.new "Clay"
      total_pay = test.pay 200000
      expect(total_pay).to eq(20000)
    end
  end
end