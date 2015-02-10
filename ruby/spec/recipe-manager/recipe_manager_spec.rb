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

  describe "#add_recipe" do
    before :each do
      @test = RecipeManager.new
    end

    it "should add a recipe to the manager" do
      r = Recipe.new "Creole Chicken"
      @test.add_recipe(r)
      expect(@test.recipes.count).to eq(1)
      expect(@test.recipes["Uncategorized"].count).to eq(1)
    end

    it "should add a recipe with a category to the manager" do
      @test.add_category("Dessert")
      r = Recipe.new "Hot Chocolate"
      @test.add_recipe(r, "Dessert")
      expect(@test.recipes["Dessert"].count).to eq(1)
    end

    it "should throw an error if a category hasn't been added yet" do
      r = Recipe.new "Bourbon Chicken"
      expect { @test.add_recipe(r, "Dinners") }.to raise_error(RuntimeError)
    end
  end

  describe "#get_recipe_by_category" do
    before :each do
      @test = RecipeManager.new
      @test.add_category("Dinners")
      @test.add_category("Breakfasts")
      @test.add_recipe(Recipe.new("Bourbon Chicken"), "Dinners")
      @test.add_recipe(Recipe.new("Steak Toscano"), "Dinners")
      @test.add_recipe(Recipe.new("Pain Perdu"), "Breakfasts")
    end

    it "should get a list of all recipes in the given category" do
      items = @test.get_recipe_by_category("Dinners")
      expect(items.count).to eq(2)
      item_names = items.map { |e| e.name }
      expect(item_names).to eq(["Bourbon Chicken", "Steak Toscano"])
    end
  end




end