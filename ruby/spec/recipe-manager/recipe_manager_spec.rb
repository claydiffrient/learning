describe RecipeManager do
  describe "#initialize" do
    it "should instantiate properly" do
      test = RecipeManager.new
      expect(test).not_to be_nil
    end
  end

  describe "#add_category" do
    before :each do
      @test = RecipeManager.new
    end

    it "should allow a category to be added" do
      @test.add_category("Meat")
      expect(@test.categories.include?("Meat")).to be true
    end

    it "should not add a duplicate category" do
      @test.add_category("Dessert")
      @test.add_category("Dessert")
      found = @test.categories.select { |e| e == "Dessert" }
      expect(found.count).to eq(1)
    end
  end

end