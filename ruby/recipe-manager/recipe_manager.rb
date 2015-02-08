class RecipeManager
  attr_reader :categories

  def initialize
    @categories = []
  end

  def add_category(category)
    unless @categories.include?(category)
      @categories << category
    end
  end
end