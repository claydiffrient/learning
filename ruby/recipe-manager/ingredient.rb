class Ingredient
  attr_accessor :quantity, :measure, :name

  def initialize(quantity, measure, name)
    @quantity = quantity
    @measure = measure
    @name = name
  end

end