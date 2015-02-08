describe Ingredient do
  describe "#initialize" do
    it "should instantiate properly" do
      i = Ingredient.new 2, "tests", "Test"
      expect(i).not_to be_nil
    end
  end
end