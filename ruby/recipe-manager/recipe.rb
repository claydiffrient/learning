

class Recipe
  attr_accessor :name, :ingredients

  def initialize(name, ingredients=[])
    @name = name
    @ingredients = ingredients
  end

end