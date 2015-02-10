class RecipeManager
  attr_reader :categories, :recipes

  def initialize
    @categories = ["Uncategorized"]
    @recipes = {"Uncategorized" => []}
  end

  def add_category(category)
    unless @categories.include?(category)
      @categories << category
      @recipes[category] = []
    end
  end

  def add_recipe(recipe, category="Uncategorized")
    if @recipes[category].nil?
      raise 'Category has not yet been added.'
    end
    @recipes[category] << recipe
  end

  def get_recipe_by_category(category)
    @recipes[category]
  end

end