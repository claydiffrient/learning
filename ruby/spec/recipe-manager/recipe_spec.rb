describe Recipe do

  describe '#initialize' do
    it "should instantiate properly" do
      r = Recipe.new "Creole Chicken"
      expect(r).not_to be_nil
    end

    it "should accept an array of ingredients" do
      ingredients = Array.new
      ingredients << Ingredient.new(2, 'cups', 'oats')
      r = Recipe.new "Steel Cut Oats", ingredients
      expect(r).not_to be_nil
      expect(r.ingredients).to eq(ingredients)
    end
  end
end

